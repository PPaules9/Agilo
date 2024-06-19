//
//  ProfileViewModel.swift
//  Agilo
//
//  Created by Pavly Paules on 19/06/2024.
//
//
//  SettingRow.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct ProfileViewModel: View {
    @Environment(\.colorScheme) var colorScheme
    let lastItem: Bool

    let imageName: String
    let title: String
    let tintColor: Color
    let goTo : String
    
    var body: some View {
        if lastItem {
            VStack {
                HStack{
                    Image(systemName: imageName)
                        .imageScale(.small)
                        .font(.title)
                        .foregroundColor(tintColor)
                        .frame(width: 40)
                    
                    Text(title)
                        .font(.custom("Charter", size: 16))
                        .font(.subheadline)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .fontDesign(.monospaced)
//                        .shadow(radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle")
                    
                }
                .padding(.horizontal)
                
            }
            .frame(width: 380, height: 20)
        } else {
            VStack {
                HStack{
                    Image(systemName: imageName)
                        .imageScale(.small)
                        .font(.title)
                        .foregroundColor(tintColor)
                        .frame(width: 40)
                    
                    Text(title)
                        .font(.custom("Charter", size: 16))
                        .font(.subheadline)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .fontDesign(.monospaced)
//                        .shadow(radius: 1)
                    
                    Spacer()
                    
                    Text(goTo)
                    
                }
                .padding(.horizontal)
                Divider()
                    .frame(height: 0.01) // Adjust height as needed
                    .background(Color(.systemGray5)) // Set border color
                //                .blur(radius: 2)
                    .offset(x: 64,y: -5)
                
            }
            .frame(width: 380, height: 20)
            
        }
    }
}

#Preview {
    ProfileViewModel(lastItem: false, imageName: "gear", title: "Version", tintColor: Color(.systemGray), goTo: "Change Name")
}
