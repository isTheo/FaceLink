//
//  CallManager.swift
//  FaceLink
//
//  Created by Matteo Orru on 10/09/24.
//

import Foundation
import StreamVideo
import StreamVideoUIKit
import StreamVideoSwiftUI




class CallManager {
    static let shared = CallManager()
    
    
    
    struct Constants {
        static let userToken = "TOKEN"
    }
    
    
    
    private var video: StreamVideo?
    private var videoUI: StreamVideoUI?
    public private(set) var callViewModel: CallViewModel?
    
    
    
    struct UserCredentials {
        let user: User
        let token: UserToken
    }
    
    
    
    func setUp(email: String) {
        setUpCallViewModel()
        
        
//UserCredential
        let credential = UserCredentials(
            user: .guest(email),
            token: UserToken(rawValue: Constants.userToken)
        )
        
        
//StreamVideo
        let video = StreamVideo(
            apiKey: "API KEY",
            user: credential.user,
            token: credential.token) { result in
                // Refresh token via real backend
                result(.success(credential.token))
        }
        
        
//StreamVideoUI
        let videoUI = StreamVideoUI(streamVideo: video)
        
        
        self.video = video
        self.videoUI = videoUI
        
    }
    
    
    
    private func setUpCallViewModel() {
        guard callViewModel == nil else {return}
        DispatchQueue.main.async {
            self.callViewModel = CallViewModel()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
