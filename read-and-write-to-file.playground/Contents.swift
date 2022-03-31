import Cocoa
import PlaygroundSupport

// MARK: - Files are created in a "Shared Playground Data" folder, if you don't have one you should manually create it in your Documents directory

func write(to filename: String, data: String) {
    let filename = playgroundSharedDataDirectory.appendingPathComponent(filename)

    do {
        try data.write(to: filename, atomically: true, encoding: .utf8)
    } catch let error {
        print(error.localizedDescription)
    }
}

func read(from filename: String) -> String? {
    let fileURL = playgroundSharedDataDirectory.appendingPathComponent(filename, isDirectory: false)
    
    do {
        let data = try Data(contentsOf: fileURL)
        let string = String(data: data, encoding: .utf8)
        return string
    } catch let error {
        print(error.localizedDescription)
        return nil
    }
}

write(to: "test.txt", data: "Hello Swift!")
read(from: "test.txt")
