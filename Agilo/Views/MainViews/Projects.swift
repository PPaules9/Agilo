//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct Projects: View {
    @Namespace var namespace
    @Namespace var namespace1
    @State var show = false
    @State var show2 = false
    @State private var counter = 0
    @State private var newProject = Project(id: UUID(), name: "", activated: false)
    @State private var projectContainer = ProjectData()

    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                
                HStack {
                    Text("Project")
                        .font(.system(size: 32, design: .monospaced))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                Section("Active Project"){
                }
            }
        }
    }
}

#Preview {
    Projects()
}
