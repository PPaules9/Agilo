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
    @State private var newProject = Project(id: UUID(), name: "", activated: false)
    @State private var projectContainer = ProjectData()
    
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
                
                Section("Active Project"){
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
                
                Section("Add another Project"){
                    Text("Add Project Banner")
                        .frame(width: 300, height: 150)
                        .background(Color(.orange))
                        .cornerRadius(15)
                }
                Section("Your Projects"){
                    ForEach($projectContainer.projects) { $item in
                        Toggle(item.name, isOn: $item.activated)
                    }
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
    Projects()
}
