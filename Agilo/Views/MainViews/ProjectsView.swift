import SwiftUI

struct ProjectsView: View {
    
    @ObservedObject var projectContainer: ProjectData
    @Binding var newProject: Project
    
    @State private var showingDeleteAlert = false

    var body: some View {
        NavigationView {
            List {
                ForEach(projectContainer.projects) { newProject in
                    NavigationLink(destination: ProjectItemView(projectContainer: projectContainer, newProject: newProject)) {
                        HStack {
                            Image(systemName: newProject.symbol)
                                .foregroundColor(Color(newProject.color))
                            Text(newProject.name)
                            
                            Spacer()
                            
                            if newProject.selected {
                                Text("active")
                                    .foregroundColor(Color.gray)
                            } else {
                                Text("")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                }
                .onDelete { indexSet in
                    projectContainer.removeItems(at: indexSet)
                    showingDeleteAlert = true
                }
            }
            .navigationTitle("My Projects List")            
        }
    }
}

#Preview {
    ProjectsView(projectContainer: ProjectData(), newProject: .constant(Project()))
}
