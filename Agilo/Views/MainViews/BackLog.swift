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
    
    var body: some View {
        if let activeProject = projectContainer.getActiveProject() {
            
            NavigationStack {
                VStack(alignment: .leading){
                    HStack {
                        Text("Your Active Project is: \(activeProject.name)")
                            .font(.system(size: 32, design: .monospaced))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    
                }
                .padding(.top, 10)
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
