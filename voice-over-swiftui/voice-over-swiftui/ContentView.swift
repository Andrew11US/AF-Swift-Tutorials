//
//  ContentView.swift
//  voice-over-swiftui
//
//  Created by Andrew on 2023-08-12.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = Array(repeating: .blue, count: 9)
    @State private var customLabelColor: Color = .orange
    let items = [1, 2, 3, 6, 5, 4, 7, 8, 9]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @AccessibilityFocusState private var isFocusedImage
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                HStack {
                    Text("Element order")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        ZStack {
                            Rectangle()
                                .foregroundColor(colors[item - 1])
                                .frame(width: 80, height: 50)
                                .cornerRadius(10)
                                .onTapGesture {
                                    colors[item-1] = colors[item-1] == .blue ? .red : .blue
                                }
                                .accessibilityValue(colors[item-1] == .red ? "Selected" : "")
//                                .accessibilitySortPriority(Double(item))
                            Text(String(item))
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                        .accessibilitySortPriority(Double(items.count - item - 1))
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Focus move")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Button("Switch focus") {
                    isFocusedImage.toggle()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .accessibilityHint("Double tap to move focus onto an image")
            }
            
            VStack {
                HStack {
                    Text("Custom action")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Text("Change Color")
                .frame(maxWidth: .infinity)
                .padding()
                .background(customLabelColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .onTapGesture(count: 2) {
                    customLabelColor = customLabelColor == .orange ? .red : .orange
                }
                .accessibilityAction {
                    customLabelColor = customLabelColor == .orange ? .red : .orange
                }
            }
            
            VStack {
                HStack {
                    Text("Announcement")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Button("Make announcement") {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        UIAccessibility.post(notification: .announcement, argument: "This is a Voice Over announcement")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
            }
            
            VStack {
                HStack {
                    Text("Focus image")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Image("mountain")
                    .resizable()
                    .frame(height: 100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .accessibilityLabel("Picture of a mountain")
                    .accessibilityFocused($isFocusedImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
