import SwiftUI

struct Add : View {
    
    @ObservedObject var projectContainer : ProjectData
    @State private var newProject = Project()
    
    @State var isNew = false
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: BackLogTask?
    @State private var isPickingSymbol = false
    @State private var isAddingNewProject = false
    
    var body: some View {
        Form {
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: newProject.symbol)
                        .imageScale(.large)
                        .foregroundStyle(Color(newProject.color))
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                TextField("New Project", text: $newProject.name)
                    .font(.title)
                
            }
            .padding(.top, 5)
            //            DatePicker("Deadline", selection: $newProject.deadLine)
            //                .listRowSeparator(.hidden)
            DatePicker("Expected Deadline", selection: $newProject.deadLine, displayedComponents: .date)
            DatePicker("Start Date", selection: $newProject.startDay, displayedComponents: .date)
            
            Section{
                TextField("Scrum Master", text: $newProject.scrumMaster)
                                
                Stepper("No. of Sprints:   \(newProject.sprint)", value: $newProject.sprint)
            }
                Section("Make This Project your Current Project"){
                    Toggle("Activate The Project", isOn: $newProject.selected)
                }
                
                Button {
                    projectContainer.add(newProject)
                    dismiss()
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
    Add(projectContainer: ProjectData(), isNew: true )
        .environmentObject(ProjectData())
}
