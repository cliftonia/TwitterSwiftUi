//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Clifton Baggerman on 10/8/2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercaseQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullName.lowercased().contains(lowercaseQuery)
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
