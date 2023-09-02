//
//  ContentView.swift
//  dynamic-font-swiftui
//
//  Created by Andrew on 2023-08-16.
//

import SwiftUI

extension View {
    @ViewBuilder func scaledFont(name: String = UIFont.systemFont(ofSize: 0).familyName, size: CGFloat, weight: Font.Weight = .regular) -> some View {
      if #available(iOS 16.0, *) {
         self
              .font(.custom(name, size: size, relativeTo: .body))
              .fontWeight(weight)
      } else {
         self
          .font(
            .custom(name, size: size, relativeTo: .body)
            .weight(weight)
          )
      }
    }
}

extension Font {
    static let titleSemibold = Font.system(.title, design: .default, weight: .semibold)
    static let title30Semibold = Font.system(size: 30, weight: .semibold, design: .default)
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Large Title!")
                .font(.largeTitle)
            Text("Bold Title!")
                .font(.title)
                .bold()
            Text("Semibold Title!")
                .font(.titleSemibold)
            Text("Static Title size 30!")
                .font(.title30Semibold)
            Text("Dynamic SF Pro light text size 24")
                .scaledFont(size: 24, weight: .light)
            Text("Dynamic Helvetica thin text size 16")
                .scaledFont(name: "Helvetica", size: 16, weight: .thin)
            Text("Dynamic SF Pro light text size 20 restricted")
                .scaledFont(size: 20, weight: .light)
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
