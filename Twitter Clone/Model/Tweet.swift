//
//  Tweet.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: UserObj?
    var didLike: Bool? = false
}
