

import SwiftData
import SwiftUI


struct ProjectModel: Identifiable, Codable, Equatable {
    var id: UUID
    var title: String = "First Project"
    var dateCreated: Date
    
    var completed: Bool = false  // Default to uncompleted
    var kind : String
    var priority : String
    
}

class ProjectManager: ObservableObject {
    @Published var projects: [ProjectModel] = []
    
    func addProject(title: String, kind: String, priority: String, dueDate: Date? = nil, notes: String? = nil) {
        projects.append(ProjectModel(id: UUID(), title: title, dateCreated: Date(), kind: kind, priority: priority))
    }
    
    func deleteProject(at index: Int) {
        projects.remove(at: index)
    }
    
    func sortProjects(by key: String) {
        switch key {
        case "priority":
            projects.sort(by: { $0.priority < $1.priority })
        case "dateCreated":
            projects.sort(by: { $0.dateCreated < $1.dateCreated })
            // Add sorting logic for other keys (kind, etc.)
        default:
            break
        }
    }
}


struct ProjectRowView: View {
    let project: ProjectModel
    
    var body: some View {
        HStack {
            Text(project.title)
                .font(.headline)
            Spacer()
            Text(project.priority)
                .font(.caption)
        }
    }
}


struct OptionalDate {
  var date: Date?
  var isSelected: Bool
}

struct AddProjectView: View {
    @Environment(\.dismiss) var dismiss // To dismiss the sheet
    @State private var dueDate: OptionalDate = OptionalDate(date: nil, isSelected: false)

    let projectManager: ProjectManager
    
    @State private var title = ""
    @State private var kind = ""
    @State private var priority = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Project Title", text: $title)
                TextField("Project Kind", text: $kind)
                TextField("Project Priority", text: $priority)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationTitle("Add Project")
            .toolbar {
                Button("Save") {
                    projectManager.addProject(title: title, kind: kind, priority: priority)
                    dismiss() // Close the sheet
                }
            }
        }
    }
}
