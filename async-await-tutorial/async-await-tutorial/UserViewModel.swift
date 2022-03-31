//
//  UserViewModel.swift
//  async-await-tutorial
//
//  Created by Andrew on 2022-03-31.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    
    func getUser() async {
        do {
            let user = try await WebService().fetchData(url: Constants.userUrl.rawValue)
            self.user = user
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
