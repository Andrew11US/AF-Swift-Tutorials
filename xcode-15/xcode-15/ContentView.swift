//
//  ContentView.swift
//  xcode-15
//
//  Created by Andrew on 2023-09-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    #if DEBUG
        Text("Debug mode")
    #else
        Text("Release mode")
    #endif
    }
}

#Preview {
    ContentView()
}
