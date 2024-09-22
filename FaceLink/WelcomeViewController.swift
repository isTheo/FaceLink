//
//  ViewController.swift
//  FaceLink
//
//  Created by Matteo Orru on 09/09/24.
//

import UIKit

//Auth: sign up / sign in
//Join call (stream)
//sign out


class WelcomeViewController: UIViewController, WelcomeViewDelegate {
    
    
    override func loadView() {
        let view = WelcomeView()
        view.delegate = self
        self.view = view
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        AuthManager.shared.signUp(email: "john@example.com", password: "password") { [weak self] done in
//            guard done else {
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self?.showAccount()
//            }
//        }
    }
    
    
    
    private func showAccount() {
        let vc = UINavigationController(rootViewController: AccountViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    
    func didTapSignIn(email: String?, password: String?) {
        
    }
    
    
    
    func didTapSignUp(email: String?, password: String?) {
        
    }
    
    
    
    
    
}

