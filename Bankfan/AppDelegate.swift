//
//  AppDelegate.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 29/12/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private let loginVC = LoginVC()
    private let mainVC = MainVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginVC.delegate = self
//        self.setRootViewController( mainVC)
        self.setRootViewController(AccountSummaryVC())
        
        return true
    }
    
}

// MARK: - LoginVCDelegate
extension AppDelegate : LoginVCDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            self.setRootViewController(LogoutVC())
        } else {
            self.setRootViewController(OnboardingContainerVC())
        }
    }
}

extension AppDelegate: LogoutVCDelegate {
    func didLogout() {
        setRootViewController(self.loginVC)
    }
}

// MARK: Methods
extension AppDelegate {
    private func setRootViewController (_ vc : UIViewController, animated : Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
