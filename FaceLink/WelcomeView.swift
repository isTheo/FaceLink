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
        return field
    }()
    
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Passowrd"
        field.isSecureTextEntry = true
        field.returnKeyType = .next
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    
    
    // Action button
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
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
