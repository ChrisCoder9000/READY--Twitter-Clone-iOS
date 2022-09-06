//
//  UploadTweetsViewModel.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
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
                
            }
        }
    }
}
