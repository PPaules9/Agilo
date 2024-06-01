import SwiftUI

struct Add : View {
    
    @ObservedObject var eventData: EventData
    @State private var newEvent = Event()
    @Binding var event: Event
    
    @State private var teamMembers = ""
    @State private var showCheckmark = false // Track whether to show checkmark
    
    @State var isNew = false
    @Environment(\.dismiss) private var dismiss
    @FocusState var focusedTask: EventTask?
    @State private var isPickingSymbol = false
    @State private var isAddingNewProject = false
    
    var body: some View {
        List {
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: event.symbol)
                        .imageScale(.large)
                        .foregroundColor(Color(event.color))
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                TextField("New Project", text: $event.title)
                    .font(.title)
                
            }
            .padding(.top, 5)
            DatePicker("Deadline", selection: $event.date)
                .listRowSeparator(.hidden)
            
            Section("Members"){
                HStack{
                    TextField("Scrum Master", text: $event.scrumMaster)
                    Button(action: {
                        // Your action for the info button
                        // For example, show an alert or popover with more information
                        print("Info button tapped!")
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title2) // Adjust the size as needed
                            .foregroundColor(.gray)
                    }
                    
                }
                HStack{
                    TextField("Team Members", text: $teamMembers)
                    Button(action: {
                        // Your action for the info button
                        // For example, show an alert or popover with more information
                        print("Info button tapped!")
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title2) // Adjust the size as needed
                            .foregroundColor(.gray)
                    }
                    // fel i hna show al team members nafsohm alli at3mlohm add plus al indication bta3 mien homa dol
                }
                HStack{
                    ZStack{
                        Button("Add Member") {
                            if !teamMembers.isEmpty {
                                event.teamMembers.append(teamMembers)
                                teamMembers = ""
                                withAnimation {
                                    showCheckmark = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation {
                                        showCheckmark = false
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Keep button aligned left
                        Spacer()
                        
                        if showCheckmark {
                            Group{
                                Text("Added")
                                    .offset(x:100)
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .padding(.leading, 290)
                            }
                            .transition(.scale.combined(with: .opacity)) // Add a smooth transition
                        }
                    }
                }
            }
            
            
            Section("Product Backlog") {
                ForEach($event.tasks) { $item in
                    TaskRow(task: $item, focusedTask: $focusedTask)
                }
                .onDelete(perform: { indexSet in
                    event.tasks.remove(atOffsets: indexSet)
                })
                
                Button {
                    let newTask = EventTask(text: "", isNew: true)
                    event.tasks.append(newTask)
                    focusedTask = newTask
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Task")
                    }
                }
                .buttonStyle(.borderless)
            }
            
            
            Button {
                eventData.add(newEvent)
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
            SymbolPicker(event: $event)
        }
    }
}

struct EventEditor_Previews: PreviewProvider {
    static var previews: some View {
        Add(eventData: EventData(), event: .constant(Event()), isNew: true)
            .environmentObject(EventData())
    }
}
