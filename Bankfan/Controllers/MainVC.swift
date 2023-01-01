//
//  MainVC.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import Foundation 
import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }

    private func setupViews() {
        let summaryVC = AccountSummaryVC()
        let moneyVC = MoveMoneyVC()
        let moreVC = MoreVC()

        summaryVC.setTabBarItem(with: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarItem(with: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarItem(with: "ellipsis.circle", title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.barTintColor = UIColor.Asset.primary

        self.viewControllers = [summaryNC, moneyNC, moreNC]
            .map({(navigationController) in
                navigationController.navigationBar.hideLine()
                return navigationController
            })
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .Asset.primary
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
