import UIKit

func isValid(email: String) -> Bool {
    let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"#
    return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
}

func valiudate(email: String) -> Bool {
    do {
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"#
        let emailRegex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let textRange = NSRange(location: 0, length: email.count)
        if emailRegex.firstMatch(in: email, options: [], range: textRange) != nil {
            return true
        } else {
            return false
        }
    } catch let error {
        print(error.localizedDescription)
        return false
    }
}

isValid(email: "aaa")
isValid(email: "test@gmail.us")

valiudate(email: "test@gmail")
valiudate(email: "test@gmail.com")
