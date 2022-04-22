import SwiftUI
import PlaygroundSupport

struct User: Identifiable {
    var id = UUID()
    var name: String
}

let user = User(name: "Alice")
let nameKeypath = \User.name
print(nameKeypath)

struct ContentView: View {
    let users = [User(name: "Alice"), User(name: "Bob"), User(name: "Jack")]
    
    var body: some View {
        ForEach(users, id: \.id) { user in
            Text(user.name)
        }.padding()
    }
}

let view = ContentView()
PlaygroundPage.current.setLiveView(view)


