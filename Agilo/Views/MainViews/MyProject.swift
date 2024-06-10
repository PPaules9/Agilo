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
    let event = BackLog()
    @State private var newProject = Project(id: UUID(), name: "", activated: false, backlogData: BackLogData())
    @ObservedObject var projectContainer : ProjectData
    @State private var isActive = false
    
    var body: some View {
        NavigationSplitView{
            ScrollView(showsIndicators: false){
                HStack {
                    Text("Project")
                        .font(.system(size: 32, design: .monospaced))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
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
                
                Text("Add Project Banner")
                    .frame(width: 300, height: 150)
                    .background(Color(.orange))
                    .cornerRadius(15)
                
                ForEach($projectContainer.projects) { $item in
                    Toggle(item.name, isOn: $isActive)
                }
            }
            .padding(.top, 10)

        }
        
    detail: {
        ZStack {
            Text("Select an Event")
                .foregroundStyle(.secondary)
        }
    }
        
    }
}

#Preview {
    Projects(
         projectContainer: ProjectData()
    )
}
