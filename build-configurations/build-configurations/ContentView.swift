//
//  ContentView.swift
//  build-configurations
//
//  Created by Andrew on 2022-04-22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var url: String?
    
    var body: some View {
        VStack {
            Text(url ?? "No Data")
                .padding()
            Button("Get the URL") {
                url = Bundle.main.infoDictionary?["BASE_URL"] as? String
            }
            .padding(20)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(20)
            Text("Current config: \(Configuration.current.rawValue)")
                .padding()
                .foregroundColor(.red)
            Text(Configuration.baseURL)
                .padding()
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
