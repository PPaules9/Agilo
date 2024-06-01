//
//  SuggestedProject.swift
//  Agilo
//
//  Created by Pavly Paules on 27/04/2024.
//

import SwiftUI

struct SuggestedProject: View {
    @Environment(\.colorScheme) var colorScheme
    var BackgroundColor: Color {
        colorScheme == .light ?  Color(hue: 1.0, saturation: 0.338, brightness: 0.197) : Color(.white)
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundColor(Color(.orange.opacity(0.5)))
//                .foregroundColor(Color(hue: 1.0, saturation: 0.047, brightness: 0.944))
            Text("DSDS")
                .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                .fontDesign(.monospaced)
            
            Button(action:  {
                //Add ot to your Projects
                
            }, label:{
                ZStack{
                    Rectangle()
                        .fill(.thickMaterial)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .frame(width:70, height: 35)
                        .shadow(radius: 15)
                    HStack {
                        Text("Get")
                            .bold()
                            .fontDesign(.monospaced)
                            .foregroundStyle(BackgroundColor)
                    }
                }
                .offset(x: 90, y: 170)
            })
            
        }
        .frame(width: 280, height: 400)
        
    }
}

#Preview {
    SuggestedProject()
}
