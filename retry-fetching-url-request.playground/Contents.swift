import UIKit
import Combine

struct User: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

let urlString = "https://jsonplaceholder.typicode.com/todos/1"
let url = URL(string: urlString)!
let badUrl = URL(string: "qwerty")!

var cancellable = Set<AnyCancellable>()

// Retry with Combine publisher
let publisher = URLSession.shared.dataTaskPublisher(for: url)
    .retry(3)
    .map { $0.data }
    .decode(type: User.self, decoder: JSONDecoder())
    .replaceError(with: User(userId: 0, id: 0, title: "", completed: false))
    .eraseToAnyPublisher()

publisher
    .sink(receiveValue: { user in
        print(user)
    }).store(in: &cancellable)

// Custom retry function with a callback
enum FetchingError: Error {
    case dataEmpty
    case loadingError
    case jsonParsingError
}

func fetchUser(completion: @escaping (Result<User, FetchingError>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            completion(.failure(.dataEmpty))
            return
        }
        
        guard error == nil else {
            completion(.failure(.loadingError))
            return
        }
        
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            completion(.success(user))
        } catch {
            completion(.failure(.jsonParsingError))
        }
    }.resume()
}

func retry<T: Decodable>(retries: Int, task: @escaping (_ completion: @escaping (Result<T, FetchingError>) -> Void) -> Void,  completion: @escaping (Result<T, FetchingError>) -> Void) {

    task({ result in
        switch result {
        case .success:
            completion(result)
        case .failure:
            print("\(retries) retries left")
            if retries > 1 {
                retry(retries: retries - 1, task: task, completion: completion)
            } else {
                completion(result)
            }
        }
    })
}

fetchUser { result in
    switch result {
    case .success(let user):
        print(user)
    case .failure(let error):
        print(error.localizedDescription)
    }
}

retry(retries: 3, task: fetchUser(completion:)) { result in
    switch result {
    case .success(let user):
        print(user)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
