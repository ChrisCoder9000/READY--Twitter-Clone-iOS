//
//  User.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
//

import FirebaseFirestoreSwift

struct UserObj: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
