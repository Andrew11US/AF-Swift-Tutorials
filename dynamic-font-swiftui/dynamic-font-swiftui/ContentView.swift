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

extension UIFont {
    static let largeFont = UIFont.systemFont(ofSize: 16, weight: .light)
    static let largeFont2 = UIFont.preferredFont(forTextStyle: .callout)
}

extension Font {
    static let largeSemibold2 = Font.system(size: 16, weight: .semibold, design: .default)
    static let largeSemibold = Font.system(.callout, design: .default, weight: .semibold)
    static let superLarge = Font.custom("", size: 30, relativeTo: .title)
    static let superLarge2 = Font.custom(UIFont().familyName, size: 30, relativeTo: .title)
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, Title!")
                .font(.largeTitle)
                .bold()
            Text("Hello, Custom Title!")
                .font(.superLarge)
            Text("Hello, Custom name Title!")
                .font(.superLarge)
            Text("Hello, regular text!")
                .font(.callout)
            Text("Hello, non dynamic regular text!")
                .scaledFont(name: "Helvetica", size: 16, weight: .thin)
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            Text("Hello, UIFont regular text!")
                .font(.custom(UIFont.largeFont.familyName, size: UIFont.largeFont.pointSize))
                .fontWeight(.bold)
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            Text("Hello, regular bold text!")
                .font(.callout)
                .bold()
            Text("Hello, regular semibold text!")
                .font(.largeSemibold)
        }
        .padding()
        .onAppear {
            print(UIFont.systemFont(ofSize: 12).fontName)
            print(UIFont.systemFont(ofSize: 12).familyName)
            print(UIFont.systemFont(ofSize: 12).fontDescriptor.fontAttributes)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
