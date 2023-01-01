//
//  LogoutVC.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import UIKit

protocol LogoutVCDelegate : AnyObject {
    func didLogout ()
}

class LogoutVC: UIViewController {
    
    // Object
    public var delegate : LogoutVCDelegate?
    
    // Views
    let stackView = UIStackView()
    let label = UILabel()
    let logoutBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.style()
        self.layout()
    }
    
    private func style () {
        // Stack view
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 20
        
        // Label
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = "Welcome"
        self.label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // Logout button
        self.logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        self.logoutBtn.configuration = .filled()
        self.logoutBtn.setTitle("Logout", for: .normal)
        self.logoutBtn.addTarget(self, action: #selector(self.logoutBtnTapped), for: .primaryActionTriggered)
    }
    
    private func layout () {
        // Stack View
        self.stackView.addArrangedSubview(self.label)
        self.stackView.addArrangedSubview(self.logoutBtn)
        self.view.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

}


extension LogoutVC {
    @objc private func logoutBtnTapped () {
        self.delegate?.didLogout()
    }
}
