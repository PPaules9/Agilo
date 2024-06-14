//
//  SymbolPicker.swift
//  Agilo
//
//  Created by Pavly Paules on 25/05/2024.
//

import SwiftUI

struct SymbolPicker: View {
    @Environment(\.dismiss) private var dismiss
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
                
            }
            .padding()

            HStack {
                
            }
            .padding(.horizontal)
            .frame(height: 40)

            Divider()

            ScrollView {
                
            }
        }
    }
}

#Preview {
    SymbolPicker()
}
