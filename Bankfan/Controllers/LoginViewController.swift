//
//  LoginViewController.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 29/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let loginView = LoginView()
    private let signInBtn = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    private var credentials : (username:String?, password:String?) {
        return (username: loginView.usernameTextField.text, password: loginView.passwordTextField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.style()
        self.layout()
        
    }
    
}

extension LoginViewController {
    
    private func style () {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        self.titleLabel.adjustsFontForContentSizeCategory = true
        self.titleLabel.text = "Bankey"
        
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.textAlignment = .center
        self.subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        self.subtitleLabel.adjustsFontForContentSizeCategory = true
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.text = "Your premium source for all things banking!"
        
        self.loginView.translatesAutoresizingMaskIntoConstraints = false
        
        self.signInBtn.translatesAutoresizingMaskIntoConstraints = false
        self.signInBtn.configuration = .filled()
        self.signInBtn.configuration?.imagePadding = 8
        self.signInBtn.setTitle("Sign In", for: .normal)
        self.signInBtn.addTarget(self, action: #selector(self.signInBtnTapped), for: .touchUpInside)
        
        self.errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.errorMessageLabel.textAlignment = .center
        self.errorMessageLabel.textColor = .systemRed
        self.errorMessageLabel.numberOfLines = 0
        self.errorMessageLabel.isHidden = true
        
    }
    
    private func layout () {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(self.loginView)
        view.addSubview(self.signInBtn)
        view.addSubview(self.errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Login view
        NSLayoutConstraint.activate([
            self.loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 1),
            self.view.trailingAnchor.constraint(equalToSystemSpacingAfter: self.loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Sign in buttton
        NSLayoutConstraint.activate([
            self.signInBtn.topAnchor.constraint(equalToSystemSpacingBelow: self.loginView.bottomAnchor, multiplier: 2 ),
            self.signInBtn.leadingAnchor.constraint(equalTo: self.loginView.leadingAnchor),
            self.signInBtn.trailingAnchor.constraint(equalTo: self.loginView.trailingAnchor),
        ])
        
        // Input error message
        NSLayoutConstraint.activate([
            self.errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.signInBtn.bottomAnchor, multiplier: 2 ),
            self.errorMessageLabel.leadingAnchor.constraint(equalTo: self.signInBtn.leadingAnchor),
            self.errorMessageLabel.trailingAnchor.constraint(equalTo: self.signInBtn.trailingAnchor),
        ])
    }
}

extension LoginViewController {
    @objc private func signInBtnTapped () {
        self.errorMessageLabel.isHidden = true
        self.login()
    }
    
    private func login () {
        guard let username = self.credentials.username, let password = self.credentials.password else { return}
        
        self.signInBtn.configuration?.showsActivityIndicator = true
        return;
        
        if username.isEmpty || password.isEmpty {
            self.configureErrorMessage(with: "Username or password can't be empty")
        } else {
            self.configureErrorMessage(with: "Incorrect username or password.")
        }
    }
    
    private func configureErrorMessage(with message : String) {
        self.errorMessageLabel.isHidden = false
        self.errorMessageLabel.text = message
    }
}

