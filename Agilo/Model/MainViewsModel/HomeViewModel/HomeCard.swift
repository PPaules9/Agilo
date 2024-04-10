//
//  HomeCard.swift
//  Agilo
//
//  Created by Pavly Paules on 10/04/2024.
//

import SwiftUI

struct HomeCard: View {
    @State var rotation: CGFloat = 0.0

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 320, height: 180)
                    .foregroundColor(Color("c"))
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 130, height: 450)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("it"), Color("ib")]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(rotation))
                    .mask {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(lineWidth: 3)
                            .frame(width: 315, height: 175)
                    }
                VStack(alignment: .leading, spacing: 20){
                    Text("Current Deadline:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(.white))
                    Text(" 25 Aug 2024")
                        .bold()
                        .foregroundStyle(Color(.white))
                }
                .padding()
                .offset(x: -5)
            }
            .onAppear{
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                    rotation = 360
                }
            }
        }
    }
}

#Preview {
    HomeCard()
}
