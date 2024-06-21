import SwiftUI

struct Add : View {
    
    @ObservedObject var projectContainer : ProjectData
    @State private var newProject = Project()
    
    @State var isNew = false
    @Environment(\.dismiss) private var dismiss
    @State private var isPickingSymbol = false
    @State private var isAddingNewProject = false
    @State private var newTeamMember = ""
    
    var body: some View {
        NavigationStack{
            Form {
                // Adding the Project Name and Sympol
                HStack(alignment: .center){
                    Button {
                        isPickingSymbol.toggle()
                    } label: {
                        Image(systemName: newProject.symbol)
                            .imageScale(.large)
                            .foregroundStyle(Color(newProject.color))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 5)
                    
                    TextField("Project Name", text: $newProject.name)
                        .font(.title)
                        .font(.system(size: 16))
                }
                .padding(.vertical)
                
                Section("Dates"){
                    DatePicker("Start Date", selection: $newProject.startDay, displayedComponents: .date)
                    
                    DatePicker("Expected Deadline", selection: $newProject.deadLine, displayedComponents: .date)
                }
                
                Section("Details"){
                    TextField("Scrum Master", text: $newProject.scrumMaster)
                    TextField("Product Owner", text: $newProject.productOwner)
                    
                    HStack {
                        TextField("Add Team Member", text: $newTeamMember)
                        
                        Button(action: {
                            if !newTeamMember.isEmpty {
                                newProject.teamMembers.append(newTeamMember)
                                newTeamMember = ""
                            }
                        }) {
                            Text("Add Members")
                                .padding(.horizontal)
                                .padding(.vertical)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .offset(x: 10)
                        }
                    }
                    
                    Picker("Team Members", selection: $newProject.teamMembers) {
                        ForEach(newProject.teamMembers, id: \.self){ member in
                            Text("Check Members")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Sprints"){
                    Stepper("Expected Sprints:    \(newProject.sprint)", value: $newProject.sprint)
                }
                
                Section("Project Backlog"){
                    //Leave a button to go to another view and add The Backlog Tasks
                    
                    //Add the Energy Units
                }
                
                Section("Activate This Project"){
                    Toggle("Current project", isOn: $newProject.selected)
                        .onChange(of: newProject.selected){ _,  isActive in
                            if isActive {
                                projectContainer.activateProject(newProject)
                            }
                        }
                }
            }
            
            Button {
                projectContainer.add(newProject)
                dismiss()
                print([projectContainer.projects].count)
            } label: {
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    Text("Start Project")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 360)
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


#Preview {
    Add(projectContainer: ProjectData(), isNew: true )
        .environmentObject(ProjectData())
}
