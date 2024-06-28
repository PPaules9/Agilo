//
//  AddDetailsView.swift
//  Agilo
//
//  Created by Pavly Paules on 22/06/2024.
//

import SwiftUI

struct AddDetailsView: View {
    @Binding var newProject: Project
    @Binding var newTeamMember: String
    @State private var count = 1
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var showingPopover = false

    var body: some View {
        ScrollView{
        VStack {
            HStack {
                Spacer()
                
                // Question Mark Icon
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showingPopover.toggle()
                    }
                }) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                    
                }
                .offset(x: -10)
            }
            
            Text("Project Details")
                .font(.largeTitle)
                .padding()
            
            TextField("Scrum Master", text: $newProject.scrumMaster)
                .padding()
            
            TextField("Product Owner", text: $newProject.productOwner)
                .padding()
            
            HStack {
                TextField("Add Team Member", text: $newTeamMember)
                    .padding()
                
                Button(action: {
                    if !newTeamMember.isEmpty {
                        newProject.teamMembers.append(newTeamMember)
                        newTeamMember = ""
                    }
                    count += 1
                }) {
                    Text("Add Member")
                        .padding(.horizontal)
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
            }
            Divider()
                .frame(width: 360)
            
            VStack{
                HStack{
                    Text("Members Added:")
                        .font(.title)
                    Spacer()
                }
                .padding()
                
                    ScrollView {
                        LazyVGrid(columns: columns){
                            ForEach(Array(newProject.teamMembers.enumerated()), id: \.element) { index, member in
                            HStack{
                                VStack{
                                    Text("\(index + 1)- \(member)")
                                        .font(.title3)
                                }
                                Spacer()
                            }
                        }
                        .drawingGroup()
                    }
                    
                    
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
        .overlay(
            Group {
                if showingPopover {
                    ZStack{
                        VStack{}
                            .padding()
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                            )
                            .cornerRadius(5)
                            .frame(width: 200)
                        //                            .shadow(radius: 5)
                            .padding([.top, .trailing], 16)
                            .rotationEffect(.degrees(45))
                            .offset(x: 129, y: -33)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "textformat.size")
                                    .foregroundColor(.orange)
                                Text("Course Title")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            Text("This should reflect the course content and will be visible to students.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                        )
                        .cornerRadius(10)
                        .frame(width: 300)
                        //                        .shadow(radius: 10)
                        .padding([.top, .trailing], 16)
                        .transition(.move(edge: .top))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showingPopover = false
                            }
                        }
                        
                        
                    }
                    .offset(y: 45)
                    .shadow(radius: 10)
                    
                }
            }, alignment: .topTrailing
            
        )
    }
}

#Preview {
    AddDetailsView(newProject: .constant(Project()), newTeamMember: .constant(""))
}
