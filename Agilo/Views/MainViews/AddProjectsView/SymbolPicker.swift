//
//  SymbolPicker.swift
//  Agilo
//
//  Created by Pavly Paules on 25/05/2024.
//

import SwiftUI

struct SymbolPicker: View {
    @Binding var newProject: Project
    @State private var selectedColor: Color = ColorOptions.default
    @Environment(\.dismiss) private var dismiss
    @State private var symbolNames = EventSymbols.symbolNames
    @State private var searchInput = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 6)

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            HStack {
                Image(systemName: newProject.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)

            }
            .padding()

            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        newProject.color = color.rgbaColor
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)

            Divider()

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
                            newProject.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .imageScale(.large)
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = Color(newProject.color)
        }
    }
}

