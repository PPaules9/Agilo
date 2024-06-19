//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct MyProject: View {
    
    @ObservedObject var projectContainer : ProjectData
    @Binding var newProject : Project
        
    @State private var isAddingNewProject = false
    @State private var activeProjectID: UUID?
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(projectContainer.projects) { newProject in
                    NavigationLink(destination: ProjectItemView(newProject: newProject)) {
                        HStack {
                            Image(systemName: newProject.symbol)
                                .foregroundColor(Color(newProject.color))
                            Text(newProject.name)
                            
                            Spacer()
                            
                            if newProject.selected {
                                Text("active")
                                    .foregroundStyle(Color.gray)
                                
                            } else{
                                Text("")
                                    .foregroundStyle(Color.gray)
                            }
                            
                        }
                    }
                }
            }
            .padding(.top, 5)
        }
    }
}

#Preview {
    MyProject(projectContainer: ProjectData(), newProject: .constant(Project()))
}
