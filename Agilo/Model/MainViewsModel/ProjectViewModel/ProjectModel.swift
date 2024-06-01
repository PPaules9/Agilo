//
//
//import SwiftData
//import SwiftUI
//
//
////Identify each project
//struct ProjectModel: Identifiable, Codable {
//    let id: String
//    var title: String
//    let dateCreated : TimeInterval
//    let dueDate : TimeInterval
//    let kind : String
//    let priority : String
//    var isDone: Bool = false
//    var isActive: Bool = false
//    
//    mutating func setDone(_ state: Bool){
//        isDone = state
//    }
//   
//    
//}
//
////store array of ProjectModel into one object "Project"
//@Observable
//class ProjectManager {
//    var projects = [ProjectModel]()
//     var showingNewProject = false
//     var title = ""
//     var kind = ""
//     var priority = ""
//     var startDate = Date()
//     var dueDate = Date()
//
//    
//    func addProject(title: String, kind: String, priority: String, dueDate: Date ) {
//        projects.append(ProjectModel(id: UUID().uuidString, title: title, dateCreated: Date().timeIntervalSince1970, dueDate: Date().timeIntervalSinceNow, kind: kind, priority: priority, isDone: false))
//    }
//    
//    
//    func save() {
//        
//        //check if user is eligiable for saving
//        guard canSave else {
//            return
//        }
//        
//        //Get Current User id from Firebase
//        /*
//        guard let uId = Auth.auth().currentUser?.uid else{
//         return
//         }
//        */
//        
//        //Create Model
//        let newId = UUID().uuidString
//        let newProject = ProjectModel(
//            id: newId,
//            title: title,
//            dateCreated: Date().timeIntervalSince1970,
//            dueDate: dueDate.timeIntervalSince1970,
//            kind: kind,
//            priority: priority,
//            isDone: false
//        )
//         
//        
//        
//        //Save Model
//        /*
//         let db = Firestore.firestroe()
//         
//         db.collection("users)
//         .document(uId)
//         .collection("Projects)
//         .document("123")
//         .setData([:])
//         
//         */
//        
//    }
//    
////    func deleteProject(at index: Int) {
////        projects.remove(at: index)
////    }
////    
////    func sortProjects(by key: String) {
////        switch key {
////        case "priority":
////            projects.sort(by: { $0.priority < $1.priority })
////        case "dateCreated":
////            projects.sort(by: { $0.dateCreated < $1.dateCreated })
////            // Add sorting logic for other keys (kind, etc.)
////        default:
////            break
////        }
////    }
//    
//    var canSave: Bool {
//        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return false
//        }
//        
//        guard dueDate >= Date().addingTimeInterval(-86400) else{
//            return false
//        }
//        return true
//        }
//    }
//
//
//
//
//
//
////struct ProjectRowView: View {
////    let project: ProjectModel
////    
////    var body: some View {
////        HStack {
////            Text(project.title)
////                .font(.headline)
////            Spacer()
////            Text(project.priority)
////                .font(.caption)
////        }
////    }
////}
////
////
////
////struct OptionalDate {
////  var date: Date?
////  var isSelected: Bool
////}
////
//
//
////struct AddProjectView: View {
////    @Environment(\.dismiss) var dismiss // To dismiss the sheet
////    @State private var dueDate: OptionalDate = OptionalDate(date: nil, isSelected: false)
////
////    let projectManager: ProjectManager
////    
////    @State private var title = ""
////    @State private var kind = ""
////    @State private var priority = ""
////    
////    var body: some View {
////        NavigationView {
////            Form {
////                TextField("Project Title", text: $title)
////                TextField("Project Kind", text: $kind)
////                TextField("Project Priority", text: $priority)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            }
////            .navigationTitle("Add Project")
////            .toolbar {
////                Button("Save") {
////                    projectManager.addProject(title: title, kind: kind, priority: priority)
////                    dismiss() // Close the sheet
////                }
////            }
////        }
////    }
////}
