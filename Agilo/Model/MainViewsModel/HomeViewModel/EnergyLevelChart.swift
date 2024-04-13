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
                    .foregroundStyle(LinearGradient(gradient:             Gradient(stops: [.init(color: Color(hex: 0xffcc00, alpha: 1), location: CGFloat(0)), .init(color: Color(hex: 0x1abd8c, alpha: 1), location: CGFloat(1))])            , startPoint: UnitPoint(x: 0.1786061951567302, y: 0.883022221559489), endPoint: UnitPoint(x: 0.8213938048432697, y: 0.11697777844051105)))
                
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
