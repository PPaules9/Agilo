//
//  SettingRow.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct SettingRow: View {
    @Environment(\.colorScheme) var colorScheme

    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: imageName)
                    .imageScale(.small)
                    .font(.title)
                    .foregroundColor(tintColor)
                    .frame(width: 40)
                
                Text(title)
                    .font(.custom("Charter", size: 18))
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .fontDesign(.monospaced)
                    .shadow(radius: 1)
                
                Spacer()
                
                Image(systemName: "arrow.right.circle")

            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    SettingRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
