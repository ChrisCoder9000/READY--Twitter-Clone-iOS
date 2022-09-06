//
//  ProfileViewModel.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let user: UserObj
    
    init(user: UserObj) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            for i in 0 ..< tweets.count { i
                self.tweets[i].user = self.user
            }
        }
    }
}
