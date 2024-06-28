//
//  AddSprintsView.swift
//  Agilo
//
//  Created by Pavly Paules on 22/06/2024.
//

import SwiftUI

struct AddSprintsView: View {
    @Binding var newProject: Project
    @State private var showingPopover = false
    
    var body: some View {
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
            
            Text("Project Sprints")
                .font(.largeTitle)
                .padding()
            
            Stepper("Expected Sprints: \(newProject.sprint)", value: $newProject.sprint)
                .padding()
            
            Spacer()
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
