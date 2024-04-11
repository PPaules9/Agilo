//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct Projects: View {
    
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack{
            if !show {
                ScrollView{
                    VStack{
                        ProjectCardView(namespace: namespace, show: $show)
                        ProjectCardView(namespace: namespace, show: $show)
                    }
                    
                }
                
                ZStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .offset(x: 140, y: 290)
                    })
                }
                
            } else {
                ProjectDetailView(namespace: namespace, show: $show)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "plus.square")
                                // Menu icon (3 dots)
                            }
                        }
                    }
            }
        }
        
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
        
    }
    
}

#Preview {
    Projects()
}
/*
 
 This is will mainly about every one specific task in the current sprint
Project View: In this tab, users can access a list of projects they’ve created or are participating in. They can view details about each project, including its backlog, sprint history, and team members. This view allows for comprehensive project management and tracking.
 
 **Project View**:
    - **Project List**: Present a list of projects created by the user or shared with them, along with key project details such as project name, team members, and current status (e.g., active, completed).
    - **Project Details**: Upon selecting a specific project, display comprehensive project details including the backlog of user stories, sprint history, release plans, and any associated documents or files.
    - **Team Collaboration**: Enable users to manage team collaboration by viewing team member roles, assigning tasks, and communicating within the project via comments or chat functionality.
    - **Progress Tracking**: Provide visual representations of project progress, such as sprint burndown charts, velocity charts, and cumulative flow diagrams, to help users monitor project health and identify potential bottlenecks.

*/
