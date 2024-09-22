//
//  WelcomeView.swift
//  FaceLink
//
//  Created by Matteo Orru on 21/09/24.
//

import UIKit



protocol WelcomeViewDelegate: AnyObject {
    func didTapSignIn(email: String?, password: String?)
    
    func didTapSignUp(email: String?, password: String?)
}



class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewDelegate?
    
    enum State {
        case sign_In
        case sign_Up
    }
    
    private var state: State = .sign_In
    
    
    
    // Field: email/pass
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.keyboardType = .emailAddress
        field.placeholder = "Email Address"
        field.returnKeyType = .next
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.returnKeyType = .next
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    
    
    
    // Action button
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    // Change state button
    
    private let stateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(button)
        addSubview(stateButton)
        
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        stateButton.addTarget(self, action: #selector(didTapStateButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            emailField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            emailField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.topAnchor, constant: 60),
            passwordField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            passwordField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: passwordField.topAnchor, constant: 200),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            stateButton.topAnchor.constraint(equalTo: button.topAnchor, constant: 60),
            stateButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            stateButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -20),
            stateButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    
    @objc private func didTapButton() {
        
    }
    
    
    
    @objc private func didTapStateButton() {
        switch state {
            case .sign_In:
            state = .sign_Up
            stateButton.setTitle("Sign In", for: .normal)
            
        case .sign_Up:
            state = .sign_In
            stateButton.setTitle("Create Account", for: .normal)
        }
    }
    
    
    
    
    
    
    
}
