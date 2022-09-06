//
//  ExploreViewModel.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 06/09/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [(UserObj)]()
    @Published var searchText = ""
    var searchableUsers: [UserObj] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
