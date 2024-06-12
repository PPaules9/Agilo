import SwiftUI

struct Add : View {
    
    @State private var projectContainer = ProjectData()
    @State private var newProject = Project(id: UUID(), name: "", activated: false
                                             
//                                            ,milestones: [BackLog(
//        title: "Design and Planning",
//        date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)
//    ),BackLog(
//        title: "Chassis and Frame",
//        date: Date.roundedHoursFromNow(60 * 60 * 22)
//    )
//    ]
    )
    
    @State private var teamMembers = ""
    
    @Environment(\.dismiss) private var dismiss
    @State var isActivated = false
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
            
            Toggle("Make it your Current Project?", isOn: $newProject.activated)
            
            

        }
        
        
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .sheet(isPresented: $isPickingSymbol) {
            SymbolPicker(newProject: $newProject)
        }
    }
}


#Preview { 
        Add()
}
