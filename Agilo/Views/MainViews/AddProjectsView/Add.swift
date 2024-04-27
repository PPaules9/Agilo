//
//  Add.swift
//  Agilo
//
//  Created by Pavly Paules on 19/04/2024.
//

import SwiftUI

struct Add: View {
    @Binding var projects : Int
    @State private var doneAdding = false
    @State var projectName = ""
    var projectKind = ["Build An App", "Construction", "Campaign", "Doing a Research", "Writing", "Design", "Other"]
    @State private var selectedKind = "Red"
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Project Name", text: $projectName)
                    Picker("Project Kind", selection: $selectedKind) {
                        ForEach(projectKind, id: \.self) {
                            Text($0)
                        }
                    }
                    Section{
                        Button("Add"){
                            projects += 1
                            doneAdding = true
                            print(doneAdding)
                        }
                    }
                    
                    //            navigationDestination(isPresented: $doneAdding){  MainView(projects: $projects)
                    //                }
                    
                    Section{
                        Text("Next")
                        Text("Next")
                        Text("Next")
                        
                    }
                    Section{
                        Text("Next")
                        Text("Next")
                        Text("Next")
                        
                    }
                    Section{
                        Text("Next")
                        Text("Next")
                        Text("Next")
                        
                    }
                    if doneAdding {
                        NavigationLink("Add Project", destination: MainView(projects: $projects))
                    }
                }
            }
        }
    }
}
    #Preview {
        Add(projects: .constant(1))
    }
