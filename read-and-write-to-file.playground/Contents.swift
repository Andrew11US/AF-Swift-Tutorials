import Cocoa
import PlaygroundSupport

func readFile(name: String) -> [Int] {
    let testFileUrl = playgroundSharedDataDirectory.appendingPathComponent(name, isDirectory: false)
    var filterArray: [Int] = []

    do {
        // Parsing CSV
        let data = try Data(contentsOf: testFileUrl)
        let dataEncoded = String(data: data, encoding: .utf8)
    
        if let numbersArray = dataEncoded?.components(separatedBy: CharacterSet.whitespacesAndNewlines) {
            
            for item in numbersArray {
                if let element = Int(item) {
                    filterArray.append(element)
                }
            }
        }
        
    } catch {
        print("Error reading file form external resources: \(error)")
    }
    
    return filterArray
}

func writeToFile(name: String, data: [Int]) {
    
    var output: String = ""
    
    for item in data {
        output.append(String(item))
        output.append("\n")
    }
    
    let filename = playgroundSharedDataDirectory.appendingPathComponent(name)

    do {
        try output.write(to: filename, atomically: true, encoding: .utf8)
    } catch {
        print("Unable to write to file!")
    }
}

struct RatesSnapshot: Codable {
    var lastUpdated: Double
    var rates: [String: Double]
}


protocol JSONStorage {
    associatedtype Value
    func saveJSON(filename: String, dictionary: Value) -> URL?
    func readJSON(fileURL: URL) -> Value
}

struct Storage: JSONStorage {
    typealias Value = RatesSnapshot
    func saveJSON(filename: String, dictionary: RatesSnapshot) -> URL? {
        guard let jsonData = try? JSONEncoder().encode(dictionary) else { return nil }
//        guard let jsonString = String(data: jsonData, encoding: .utf8) else { return nil }
//        let fileURL = getDocumentsDirectory().appendingPathComponent("\(filename).json")
        let fileURL = playgroundSharedDataDirectory.appendingPathComponent("\(filename).json")

        do {
            try jsonData.write(to: fileURL, options: .atomic)
            return fileURL
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func readJSON(fileURL: URL) -> RatesSnapshot {
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let snapshot = try JSONDecoder().decode(RatesSnapshot.self, from: jsonData)
            return snapshot
//            if let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Double] {
//                return dictionary
//            }
        } catch let error {
            print(error.localizedDescription)
        }
        return RatesSnapshot(lastUpdated: 0, rates: [:])
    }
}

let storage = Storage()
let snap = RatesSnapshot(lastUpdated: 100, rates: ["test" : 999])
let url = storage.saveJSON(filename: "test", dictionary: snap)
print(storage.readJSON(fileURL: url!).lastUpdated)
print(url)
