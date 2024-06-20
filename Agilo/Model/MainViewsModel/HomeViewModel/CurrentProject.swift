//
//  CurrentProject.swift
//  Agilo
//
//  Created by Pavly Paules on 12/04/2024.
//

import SwiftUI

struct CurrentProject: View {
    @ObservedObject var projectContainer : ProjectData
    
    var body: some View {
        if let activeProject = projectContainer.getActiveProject() {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 320, height: 180)
                        .foregroundStyle(LinearGradient(gradient: Gradient(stops: [.init(color: Color(hex: 0xaf52de, alpha: 1), location: CGFloat(0)), .init(color: Color(hex: 0x5f5cff, alpha: 1), location: CGFloat(1))]), startPoint: UnitPoint(x: 0.1786061951567302, y: 0.883022221559489), endPoint: UnitPoint(x: 0.8213938048432697, y: 0.11697777844051105))
                        )
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Hey Boss 👋")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                        
                        Text("You are Currently Working On:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                        
                        
                        Text(activeProject.name)
                            .bold()
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                            .font(.system(size: 14))
                        
                        
                    }
                    .padding()
                    .frame(width: 300, height: 200)
                }
                .onAppear{
                    //                withAnimation(.smooth)
                }
            }
            .frame(width:350, height: 200)
        } else  {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 320, height: 180)
                        .foregroundStyle(LinearGradient(gradient: Gradient(stops: [.init(color: Color(hex: 0xaf52de, alpha: 1), location: CGFloat(0)), .init(color: Color(hex: 0x5f5cff, alpha: 1), location: CGFloat(1))]), startPoint: UnitPoint(x: 0.1786061951567302, y: 0.883022221559489), endPoint: UnitPoint(x: 0.8213938048432697, y: 0.11697777844051105))
                        )
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Hey Boss 👋")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                        
                        Text("You are Currently Working On:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                        
                        
                        Text("No Project Activated")
                            .bold()
                            .foregroundStyle(Color(.white))
                            .fontDesign(.monospaced)
                            .font(.system(size: 14))
                        
                        
                    }
                    .padding()
                    .frame(width: 300, height: 200)
                }
                .onAppear{
                    //                withAnimation(.smooth)
                }
            }
            .frame(width:350, height: 200)
        }
    }
}

#Preview {
    CurrentProject(projectContainer: ProjectData())
}
