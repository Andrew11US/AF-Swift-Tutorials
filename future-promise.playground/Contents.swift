import UIKit
import Combine

var cancellables = Set<AnyCancellable>()

let future = Future<Int, Never> { promise in
    promise(.success(11))
    promise(.success(99))
}

let future2 = Future<String, Never> { promise in
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        promise(.success("Hello"))
    }
}

let future3 = Future<String, Error> { promise in
    URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!) { data, response, error in
        if let error = error {
            promise(.failure(error))
        }
        
        guard let data = data else {
            return
        }
        
        let string = String(data: data, encoding: .utf8) ?? ""
        promise(.success(string))
    }.resume()
}

future.sink { completion in
    print(completion)
} receiveValue: { value in
    print(value)
}

future2.sink { completion in
    print(completion)
} receiveValue: { value in
    print(value)
}.store(in: &cancellables)

future3.sink { completion in
    print(completion)
} receiveValue: { value in
    print(value)
}.store(in: &cancellables)

//let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!) { data, resoponse, error in
//    guard error == nil else { return }
//    guard let data = data else {
//        return
//    }
//
//    print(String(data: data, encoding: .utf8) ?? "")
//}
//task.resume()
