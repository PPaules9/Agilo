//
//  EnergyLevelChart.swift
//  Agilo
//
//  Created by Pavly Paules on 12/04/2024.
//

import SwiftUI

struct EnergyLevelChart: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 320, height: 180)
                    .foregroundColor(Color("lightPurple"))
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Your Energy Level is")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(.white))
                    Text("83/100")
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
    EnergyLevelChart()
}
