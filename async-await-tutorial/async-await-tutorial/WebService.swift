//
//  WebService.swift
//  async-await-tutorial
//
//  Created by Andrew on 2022-03-31.
//

import Foundation

class WebService {
    func fetchData(url: String) async throws -> User? {
        guard let url = URL(string: url) else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}
