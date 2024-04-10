//
//  SettingRow.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct SettingRow: View {
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
                .font(.custom("Charter", size: 16))
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingRow(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
