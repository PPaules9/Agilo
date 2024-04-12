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

        var body: some View {
            ScrollView(){
                HStack {
                    ZStack{
                        if !show {
                            ProjectCardView(namespace: namespace, show: $show)
                            
                        } else {
                            VStack{
                                ProjectDetailView(namespace: namespace, show: $show)
                            }
                            .frame(height: 600)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            show.toggle()
                        }
                    }
                    
                }
                HStack {
                    ZStack{
                        if !show2 {
                            trial1(namespace: namespace1, show: $show2)
                            
                        } else {
                            VStack{
                                trial2(namespace: namespace1, show: $show2)
                            }
                            .frame(height: 600)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            show2.toggle()
                        }
                    }
                    
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
 
 In this tab, users can access a list of projects they’ve created or are participating in. They can view details about each project, including its backlog, sprint history, and team members. This view allows for comprehensive project management and tracking.
 
 **Projects View**
 
 - **Project List:** Show a list of all created projects. Each project card should display:
 - Project Name
 - Short description (optional).
 - Current Sprint number.
 - Indicator of progress (green for on track, yellow for at-risk, red for off track - optional).
 - Quick access buttons to:
 - Open the detailed "Project View".
 - Archive the project.
 
 **Project View**
 
 This is the central hub for managing a specific project. It can have different sections accessible through sub-navigation (top or bottom navigation bar) or segmented controls:
 
 - **Product Backlog:**
 - List of all user stories and tasks for the project, categorized by priority.
 - Ability to add, edit, and delete user stories and tasks.
 - Drag and drop functionality to re-prioritize items.
 - Option to mark tasks as "In Progress" or "Done" for the current Sprint.
 - **Sprint Backlog:**
 - List of user stories and tasks specifically chosen for the current Sprint.
 - Inherited from the Product Backlog, showing only the selected items.
 - Ability to mark progress on individual tasks within the Sprint.
 - Option to move tasks back to the Product Backlog if needed.
 - **Meetings:**
 - Schedule and manage upcoming Sprint Planning and Daily Scrum meetings.
 - Option to integrate with calendar apps for automatic invites.
 - Ability to take notes and track action items from meetings.
 */
