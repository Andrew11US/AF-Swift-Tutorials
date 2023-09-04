//
//  AssetCatalogView.swift
//  xcode-15
//
//  Created by Andrew on 2023-09-03.
//

import SwiftUI

struct AssetCatalogView: View {
    var body: some View {
        VStack {
            Image(.lake)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .cornerRadius(10)
            Image(.retro)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .cornerRadius(10)
            Image(.flower)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .cornerRadius(10)
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .foregroundColor(.appRed)
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .foregroundColor(.appYellow)
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .foregroundColor(.appGreen)
            }
            .padding()
        }
    }
}

#Preview {
    AssetCatalogView()
}
