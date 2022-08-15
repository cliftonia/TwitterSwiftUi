//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Clifton Baggerman on 11/8/2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // Show error message
            }
        }
    }
}
