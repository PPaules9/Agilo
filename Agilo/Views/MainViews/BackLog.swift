//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct BacklogView: View {
    
    @State private var newEvent = BackLog()
    @State private var selection: BackLog?
    
    @ObservedObject var projectContainer: ProjectData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let activeProject = projectContainer.getActiveProject() {
            
            NavigationStack {
                ScrollView{
                    VStack(alignment: .leading){
                        HStack {
                            Text("Your Active Project is: \(activeProject.name)")
                                .font(.system(size: 25, design: .monospaced))
                                .bold()
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        ForEach(activeProject.backlogTasks) { tasks in
                            
                            VStack(spacing: 20){
                                Text("\(tasks.title): ")
                                HStack{
                                    Text("This is will consume")
                                    Text("\(tasks.energyUnit)")
                                    Text("Energy Unit")
                                }
                                .font(.system(size: 14, design: .monospaced))
                                CardView(imageName: "trash", title: tasks.title, subtitle: "s")
                            }
                        }
                        
                        .padding()
                    }
                    .padding(.top, 10)
                }
            }
            
        } else {
            ContentUnavailableView {
                Label("Thier is no active projects yet", systemImage: "plus")
            } description: {
                Text("You don't have any projects")
            }
        }
    }
}
#Preview {
    BacklogView(projectContainer: ProjectData())
}
