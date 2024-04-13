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
                    .foregroundStyle(LinearGradient(gradient:
                    Gradient(stops: [.init(color: Color(hex: 0xaf52de, alpha: 1), location: CGFloat(0)), .init(color: Color(hex: 0x5f5cff, alpha: 1), location: CGFloat(1))])
                    , startPoint: UnitPoint(x: 0.1786061951567302, y: 0.883022221559489), endPoint: UnitPoint(x: 0.8213938048432697, y: 0.11697777844051105))
                    )
                
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
                .offset(x: 5)
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
