//
//  AccountViewController.swift
//  FaceLink
//
//  Created by Matteo Orru on 15/09/24.
//

import Combine
import StreamVideo
import StreamVideoUIKit
import StreamVideoSwiftUI
import UIKit

class AccountViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    
    private var activeCallView: UIView?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Account"
        view.backgroundColor = .systemGreen
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Join Call", style: .done, target: self, action: #selector(joinCall))
    }
    
    
    
    @objc private func signOut() {
        AuthManager.shared.signOut()
        let vc = UINavigationController(rootViewController: WelcomeViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    
    @objc private func joinCall() {
        guard let callViewModel = CallManager.shared.callViewModel else { return }
        // Join call
        callViewModel.joinCall(callType: .default, callId: "CallIDHere")
        // Start call
//        callViewModel.startCall(callType: .default, callId: UIID().uuidString, members: [])
        
        showCallUI()
    }
    
    
    private func listenForIncomingCalls() {
        guard let callViewModel = CallManager.shared.callViewModel else { return }
        
        callViewModel.$callingState.sink { [weak self] newState in
            switch newState {
                
            case .incoming(_):
                DispatchQueue.main.async {
                    self?.showCallUI()
                }
                
            case .idle:
                DispatchQueue.main.async {
                    self?.hideCallUI()
                }
                
            default:
                break
            }
        }
        .store(in: &cancellables)
    }
    
    
    
    
    //UI Util
    
    private func showCallUI () {
        guard let callViewModel = CallManager.shared.callViewModel else { return }
        let callVC = CallViewController.make(with: callViewModel)
        
        view.addSubview(callVC.view)
        callVC.view.bounds = view.bounds
        activeCallView = callVC.view
    }
    
    
    private func hideCallUI () {
        activeCallView?.removeFromSuperview()
    }
    
    
    
    
    
    
    
}
