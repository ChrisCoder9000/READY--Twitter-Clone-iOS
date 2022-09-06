//
//  UserService.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(UserObj) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: UserObj.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([UserObj]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: UserObj.self )})
                
                completion(users)
            }
    }
}
