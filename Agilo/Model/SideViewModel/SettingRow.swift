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
        HStack{
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.custom("Charter", size: 20))
                .font(.subheadline)
                .bold()
                .foregroundColor(colorScheme == .light ? .black : .white)
        }
    }
}

#Preview {
    SettingRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
