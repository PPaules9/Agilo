import SwiftUI

struct ActivateProjectView: View {
    @Binding var newProject: Project
    @ObservedObject var projectContainer: ProjectData
    @Environment(\.dismiss) private var dismiss
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
            
            Text("Activate This Project")
                .font(.largeTitle)
                .padding()
            
            Toggle("Current project", isOn: $newProject.selected)
                .onChange(of: newProject.selected) { _, isActive in
                    if isActive {
                        projectContainer.activateProject(newProject)
                    }
                }
                .padding()
            
            Button {
                projectContainer.add(newProject)
                dismiss()
                print("Project count: \(projectContainer.projects.count)")
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
