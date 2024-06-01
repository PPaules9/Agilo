//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct Projects: View {
    @Namespace var namespace
    @Namespace var namespace1
    @State var show = false
    @State var show2 = false
    @State private var counter = 0
    let event = Event()
    
    var body: some View {
        NavigationSplitView{
            ScrollView(showsIndicators: false){
                
                Text("Add Project Banner")
                    .frame(width: 380, height: 300)
                    .foregroundColor(Color.mint)
                    .background(Color(.orange))
                
                Divider()
                ZStack{
                    if !show {
                        ProjectCardView(namespace: namespace, show: $show, event: event)
                    } else {
                        VStack{
                            ProjectDetailView(namespace: namespace, show: $show, event: event)
                        }
                        .frame(height: 650)
                    }
                }
                .onTapGesture {
                    counter += 1
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                }
                .sensoryFeedback(.impact(weight: .heavy, intensity: 100), trigger: counter)
                
            }
            .padding(.top, 10)
            .background(Color(.orange).blur(radius: 300).opacity(0.25))
            .navigationTitle("Projects")
        } detail: {
            ZStack {
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
        }
        
    }
}

#Preview {
    Projects()
}
