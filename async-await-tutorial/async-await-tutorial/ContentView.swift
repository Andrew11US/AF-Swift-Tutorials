//
//  ContentView.swift
//  async-await-tutorial
//
//  Created by Andrew on 2022-03-31.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Text(userViewModel.user?.showData() ?? "no data")
                .padding(50)
            Button("Fetch User") {
                Task {
                    await userViewModel.getUser()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
