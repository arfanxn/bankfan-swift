//
//  LoginVC.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 29/12/22.
//

import UIKit

protocol LoginVCDelegate : AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    
    // Object
    public weak var delegate : LoginVCDelegate?
    
    // Views
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let loginView = LoginView()
    private let signInBtn = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    // Animations
    private let leadingEdgeOnScreen : CGFloat = 16
    private let leadingEdgeOffScreen : CGFloat = -1000
    private var titleLeadingAnchor : NSLayoutConstraint?
    private var subtitleLeadingAnchor : NSLayoutConstraint?
    
    private var credentials : (username:String?, password:String?) {
        return (username: loginView.usernameTextField.text, password: loginView.passwordTextField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.style()
        self.layout()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitle()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInBtn.configuration?.showsActivityIndicator = false
    }
    
}

extension LoginVC {
    
    private func style () {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        self.titleLabel.adjustsFontForContentSizeCategory = true
        self.titleLabel.text = "Bankey"
        self.titleLabel.alpha = .zero
        
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
        view.addSubview(self.titleLabel)
        view.addSubview(self.subtitleLabel)
        view.addSubview(self.loginView)
        view.addSubview(self.signInBtn)
        view.addSubview(self.errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        subtitleLeadingAnchor = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subtitleLeadingAnchor?.isActive = true
        
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
    
    private func animateTitle() {
        (UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }).startAnimation()
        
        (UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.subtitleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }).startAnimation(afterDelay: 1)
        
        (UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }).startAnimation()
    }
}

extension LoginVC {
    @objc private func signInBtnTapped () {
        self.errorMessageLabel.isHidden = true
        self.login()
    }
    
    private func login () {
        guard let username = self.credentials.username, let password = self.credentials.password else { return}
        
        self.signInBtn.configuration?.showsActivityIndicator = true
        
        self.delegate?.didLogin()
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

