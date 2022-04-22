import UIKit
import Combine

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func stopLoading() { }
    
    override func startLoading() {
         guard let handler = MockURLProtocol.requestHandler else {
            return
        }
        
        do {
            let (response, data)  = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch  {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}

func setMockProtocol() {
    MockURLProtocol.requestHandler = { request in
        let exampleData =
        """
        {
        "base": "USD"
        }
        """
            .data(using: .utf8)!
        let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
        return (response, exampleData)
    }
}

struct Object: Codable {
    let base: String
}

var cancellables = Set<AnyCancellable>()

let url = URL(string: "some_url")!

let sessionConfiguration = URLSessionConfiguration.ephemeral
sessionConfiguration.protocolClasses = [MockURLProtocol.self]
let session = URLSession(configuration: sessionConfiguration)
setMockProtocol()

session.dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: Object.self, decoder: JSONDecoder())
    .sink { completion in
        print(completion)
    } receiveValue: { object in
        print(object)
    }.store(in: &cancellables)
