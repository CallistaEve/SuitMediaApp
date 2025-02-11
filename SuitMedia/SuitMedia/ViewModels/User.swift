//
//  ViewModels.swift
//  SuitMedia
//
//  Created by Evelyn Callista Yaurentius on 11/02/25.
//

import Foundation
import Combine

struct User: Identifiable, Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct UserResponse: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
}

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var page = 1
    @Published var isLoading = false
    @Published var selectedUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
        guard !isLoading else { return }
        isLoading = true
        let urlString = "https://reqres.in/api/users?page=\(page)&per_page=10"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in self.isLoading = false }, receiveValue: { response in
                self.users.append(contentsOf: response.data)
                self.page += 1
            })
            .store(in: &cancellables)
    }
}
