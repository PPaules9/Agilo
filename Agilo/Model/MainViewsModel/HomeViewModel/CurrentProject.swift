//
//  CurrentProject.swift
//  Agilo
//
//  Created by Pavly Paules on 12/04/2024.
//

import SwiftUI

struct CurrentProject: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 320, height: 180)
                    .foregroundColor(Color("lightPurple"))
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Hey Boss 👋")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(.white))
                    Text("You are Currently Working On:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(.white))
                    
                    Text("The Chemistry Project")
                        .bold()
                        .foregroundStyle(Color(.white))
                }
                .padding()
                .offset(x: -5)
            }
            .onAppear{
                //                withAnimation(.smooth)
            }
        }
    }
}

#Preview {
    CurrentProject()
}
