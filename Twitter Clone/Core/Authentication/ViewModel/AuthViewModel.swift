//
//  AuthViewModel.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 05/09/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: user session is: \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: login with: \(email)")

    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: register with: \(email)")
    }
}
