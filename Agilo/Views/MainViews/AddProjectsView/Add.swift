import SwiftUI

struct Add : View {
    
    @ObservedObject var projectContainer : ProjectData
    @State private var newProject = Project(id: UUID(), name: "", activated: false, backlogData: BackLogData())
    
    @State private var teamMembers = ""
    @State private var showCheckmark = false // Track whether to show checkmark
    
    @State var isNew = false
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: BackLogTask?
    @State private var isPickingSymbol = false
    @State private var isAddingNewProject = false
    
    var body: some View {
        List {
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: newProject.symbol)
                        .imageScale(.large)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                TextField("New Project", text: $newProject.name)
                    .font(.title)
                
            }
            .padding(.top, 5)
            DatePicker("Deadline", selection: $newProject.deadLine)
                .listRowSeparator(.hidden)
                    
            
            Button {
                projectContainer.add(newProject)
                print([projectContainer.projects].count)
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Start Project")
                }
            }
        }
        
        
        
        
        
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .sheet(isPresented: $isPickingSymbol) {
            SymbolPicker(newProject: $newProject)
        }
    }
}


#Preview { // Use the #Preview macro
    NavigationView {
        Add(
            projectContainer: ProjectData()
        )
    }
}
