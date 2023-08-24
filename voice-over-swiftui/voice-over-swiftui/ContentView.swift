//
//  ContentView.swift
//  voice-over-swiftui
//
//  Created by Andrew on 2023-08-12.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = Array(repeating: .blue, count: 9)
    @State private var labelColor: Color = .orange
    let buttons = [1, 2, 3, 6, 5, 4, 7, 8, 9]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    func changeLabelColor() { labelColor = labelColor == .orange ? .red : .orange }
    // Add focus state
    @AccessibilityFocusState(for: .voiceOver) private var isImageFocused
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                HStack {
                    Text("Element order")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                    // Header
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(buttons, id: \.self) { item in
                        Button("\(item)") {
                            colors[item - 1] = colors[item - 1] == .blue ? .red : .blue
                        }
                        .frame(width: 80, height: 50)
                        .background(item != 9 ? colors[item - 1] : .gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.system(size: 24))
                        .disabled(item == 9)
                        // Convey selected state
                        .accessibilityValue(colors[item - 1] == .red ? "Selected" : "")
                        // Custom element order
                        .accessibilitySortPriority(Double(buttons.count - item))
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Focus move")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                    // Header
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Button("Switch focus") {
                    // Move focus
                    isImageFocused.toggle()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                // Accessibility hint
                .accessibilityHint("Double tap to move focus onto the mountain image")
            }
            
            VStack {
                HStack {
                    Text("Custom action")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                    // Header
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Text("Change Color")
                .frame(maxWidth: .infinity)
                .padding()
                .background(labelColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
                .onTapGesture(count: 2) {
                    changeLabelColor()
                }
                // Custom action (works on double tap)
                .accessibilityAction {
                    changeLabelColor()
                }
                // Custom action (works from rotor)
                .accessibilityAction(named: "Change color action") {
                    changeLabelColor()
                }
            }
            
            VStack {
                HStack {
                    Text("Announcement")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.leading, 20)
                    // Header
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Button("Make announcement") {
                    // Announcement
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
                    // Header
                        .accessibilityAddTraits(.isHeader)
                    Spacer()
                }
                Image("mountain")
                    .resizable()
                    .frame(height: 100)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                // Accessibility label
                    .accessibilityLabel("Picture of a mountain")
                // Make focused view
                    .accessibilityFocused($isImageFocused)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
