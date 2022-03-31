//
//  User.swift
//  async-await-tutorial
//
//  Created by Andrew on 2022-03-31.
//

struct User: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
    
    func showData() -> String {
        "\(id) - \(userId) - \(title) : \(completed)"
    }
}
