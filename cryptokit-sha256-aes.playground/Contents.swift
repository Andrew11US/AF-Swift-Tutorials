import Cocoa
import CryptoKit

// SHA-256
let string = "Hello Swift!"
let data = Data(string.utf8)
let digest = SHA256.hash(data: data)
let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
print(hash)

// AES
let key = SymmetricKey(size: .bits256)
let message = "Hello Swift!".data(using: .utf8)!
let sealedBox = try! AES.GCM.seal(message, using: key)

let decryptedData = try? AES.GCM.open(sealedBox, using: key)
print(String(data: decryptedData ?? Data(), encoding: .utf8) ?? "")
