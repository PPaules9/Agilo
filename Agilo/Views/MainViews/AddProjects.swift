//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct AddProjects: View {
    @Binding var projects : Int
    @ObservedObject var projectManager = ProjectManager()
    @State private var showAddProjectView = false
    @State private var selectedProject: ProjectModel? = nil // Optional ProjectModel
    
    var body: some View {
        //        ContentUnavailableView {
        //            Label("Add a Project", systemImage: "plus")
        //        } description: {
        //            Text("You Can Access your Projects in the Projects tab")
        //        } actions: {
        //            NavigationLink("Create a project now", destination: Add(projects: $projects))
        //                .buttonStyle(.borderedProminent)
        //        }
        
        NavigationView {
            VStack{
                
                    Button {
                        showAddProjectView.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                .sheet(isPresented: $showAddProjectView) {
                    AddProjectView(projectManager: projectManager)
                
            }
            List {
                ForEach(projectManager.projects) { project in
                    ProjectRowView(project: project)
                        .onTapGesture {
                            selectedProject = project
                        }
                }
                .onDelete(perform: deleteProjects)
            }
            
        }
        .alert(item: $selectedProject) { project in // Use unwrapped project
            Alert(title: Text("Project Actions"),
                  message: nil,
                  primaryButton: .destructive(Text("Delete"), action: {
                if let index = projectManager.projects.firstIndex(of: project) {
                    deleteProject(at: index)
                }
            }),
                  secondaryButton: .default(Text("Cancel")))
        }
    }
    
    func deleteProjects(at offsets: IndexSet) {
        for offset in offsets {
            projectManager.deleteProject(at: offset)
        }
    }
    
    func deleteProject(at index: Int) {
        projectManager.deleteProject(at: index)
    }
}



#Preview {
    AddProjects(projects: .constant(1))
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
