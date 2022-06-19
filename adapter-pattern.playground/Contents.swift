import UIKit

protocol Downloadable {
    func download() -> String
}

struct IntegerAPI {
    func fetch() -> Int {
        123
    }
}

struct StringAPI {
    func download() -> String {
        "some string"
    }
}

// 1 way
struct IntegerAPIAdapter: Downloadable {
    func download() -> String {
        String(IntegerAPI().fetch())
    }
}
//

// 2 way
extension StringAPI: Downloadable { }

extension IntegerAPI: Downloadable {
    func download() -> String {
        String(self.fetch())
    }
}
//

struct DataLoader {
    var api: Downloadable
    
    init(api: Downloadable) {
        self.api = api
    }
    
    func downloadData() -> String {
        api.download()
    }
}

var dataLoader = DataLoader(api: IntegerAPI())
dataLoader.downloadData()

dataLoader.api = StringAPI()
dataLoader.downloadData()

dataLoader.api = IntegerAPIAdapter()
dataLoader.downloadData()
