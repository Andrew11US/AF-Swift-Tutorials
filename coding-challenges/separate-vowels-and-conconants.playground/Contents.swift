import UIKit

// Simple version
func separateVowelsAndConsonants(string: String) -> (consonants: String, vowels: String) {
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwyxz"
    var vowelsOut = ""
    var consonantsOut = ""
    
    for char in string {
        if vowels.contains(char.lowercased()) {
            vowelsOut.append(char)
        } else if consonants.contains(char.lowercased()) {
            consonantsOut.append(char)
        }
    }
    
    return (consonantsOut, vowelsOut)
}

// ChatGPT version
func separateVowelsAndConsonants2(string: String) -> (consonants: String, vowels: String) {
    let lowercaseString = string.lowercased()
    var vowels = ""
    var consonants = ""
    
    for char in lowercaseString {
        if "aeiou".contains(char) {
            vowels.append(char)
        } else if char.isLetter {
            consonants.append(char)
        }
    }
    
    return (consonants, vowels)
}

// Optimized version
func separateVowelsAndConsonants3(string: String) -> (consonants: String, vowels: String) {
    var vowels = ""
    var consonants = ""
    
    for char in string {
        if "aeiou".contains(char.lowercased()) {
            vowels.append(char)
        } else if char.isLetter {
            consonants.append(char)
        }
    }
    
    return (consonants, vowels)
}

print(separateVowelsAndConsonants(string: "Hello World"))
print(separateVowelsAndConsonants2(string: "Hello World"))
print(separateVowelsAndConsonants3(string: "Hello World"))
print(separateVowelsAndConsonants3(string: ""))
print(separateVowelsAndConsonants3(string: "Hello World 123 #$^%#*"))
print(separateVowelsAndConsonants3(string: "123439587"))
print(separateVowelsAndConsonants3(string: "%(*%*&$&^#&#@"))
