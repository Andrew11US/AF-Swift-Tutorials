import UIKit

protocol NetworkServicing {
    func loadData() -> String
}

class NetworkService: NetworkServicing {
    func loadData() -> String {
        "some data"
    }
}

// Without DI
class ViewModel1 {
    var service: NetworkServicing = NetworkService()
}

// Initializer injection
class ViewModel2 {
    private var service: NetworkServicing
    
    init(service: NetworkServicing) {
        self.service = service
    }
    
    func fetchData() -> String {
        service.loadData()
    }
}

// Property injection
class ViewModel3 {
    var service: NetworkServicing?
}

// Method injection
class ViewModel4 {
    func fetchData(service: NetworkServicing) -> String {
        service.loadData()
    }
}

// MARK: - Initializations
let networkService = NetworkService()

let viewModel1 = ViewModel1()
viewModel1.service.loadData()

let viewModel2 = ViewModel2(service: networkService)
viewModel2.fetchData()

let viewModel3 = ViewModel3()
viewModel3.service?.loadData()
viewModel3.service = networkService

let viewModel4 = ViewModel4()
viewModel4.fetchData(service: networkService)
