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
    private let onboardingVC = OnboardingContainerVC()
    private let mainVC = MainVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboardingVC.delegate = self
        
        mainVC.setStatusBar()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .Asset.primary
        
        self.registerNotificationsCenter()
        
        self.setRootViewController(loginVC)
        
        return true
    }
    
}

// MARK: - LoginVC Delegate
extension AppDelegate : LoginVCDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            self.setRootViewController(mainVC)
        } else {
            self.setRootViewController(onboardingVC)
        }
    }
}

// MARK: - Logout Delegate
extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        setRootViewController(self.loginVC)
    }
}

// MARK: - Onboarding Delegate
extension AppDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        self.setRootViewController(self.mainVC)
    }
}

// MARK: Methods
extension AppDelegate {
    
    private func registerNotificationsCenter () {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didLogout),
                                               name: .logout,
                                               object: nil)
    }
    
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
