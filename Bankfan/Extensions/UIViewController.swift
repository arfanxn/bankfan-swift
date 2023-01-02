//
//  UIViewController.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = .Asset.primary
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setTabBarItem (with systemImageName  : String, title : String) {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemImageName, withConfiguration: config)
        self.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
