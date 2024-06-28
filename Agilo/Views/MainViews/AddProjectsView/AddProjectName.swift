import SwiftUI

struct AddProjectNameView: View {
    @Binding var newProject: Project
    @Binding var isPickingSymbol: Bool
    @State private var showingPopover = false
    
    var body: some View {
        VStack(spacing: 10) {
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
                        .scaledToFit()
                        .padding()
                    
                }
                .offset(x: -10, y: -15)
            }
            
            Spacer().frame(height: 50)
            
            // Icon
            Button {
                isPickingSymbol.toggle()
            } label: {
                Image(systemName: newProject.symbol)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color(newProject.color))
            }
            
            // Course Title
            Text("Project Title")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Subtitle
            Text("Defines the project name and sympol.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            
            // Course Name
            HStack{
                Spacer()
                TextField("", text: $newProject.name)
                    .font(.title)
                    .padding(.top, 20)
                    .frame(width: 300)
                Spacer()
                
            }
            Divider()
                .frame(width: 300)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    AddProjectNameView(newProject: .constant(Project()), isPickingSymbol: .constant(false))
}
