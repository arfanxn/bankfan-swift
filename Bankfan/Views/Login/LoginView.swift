//
//  LoginView.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 29/12/22.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    private let stackView = UIStackView()
    public let usernameTextField = UITextField()
    public let passwordTextField = UITextField()
    private let dividerView = UIView()
    
    override init(frame : CGRect) {
        super.init(frame: frame)
    
        self.style()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    private func style () {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 8

        self.usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.usernameTextField.placeholder = "Username"
        self.usernameTextField.delegate = self
        
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.delegate = self
        self.passwordTextField.enablePasswordToggle()
        
        self.dividerView.translatesAutoresizingMaskIntoConstraints = false
        self.dividerView.backgroundColor = .secondarySystemFill
    }
    
    private func layout () {
        self.stackView.addArrangedSubview(self.usernameTextField)
        self.stackView.addArrangedSubview(self.dividerView)
        self.stackView.addArrangedSubview(self.passwordTextField)
        
        self.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            self.stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: self.stackView.trailingAnchor, multiplier: 1),
            self.bottomAnchor.constraint(equalToSystemSpacingBelow: self.stackView.bottomAnchor, multiplier: 1),
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.usernameTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return self.usernameTextField.text != ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
}
