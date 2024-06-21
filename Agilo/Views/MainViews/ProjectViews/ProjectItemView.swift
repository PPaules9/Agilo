import SwiftUI

struct ProjectItemView: View {
    
    @ObservedObject var projectContainer : ProjectData
    var newProject: Project
    @State var show = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: newProject.symbol)
                Text("Project Name") //Change to later newProject.name
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            // Add more project details here as needed
            
            // Add other details if available, e.g., project.deadline
            
            Spacer()
            
            Button(action: {
                projectContainer.activateProject(newProject)
            }) {
                HStack {
                    Spacer()
                    Text("Activate Project")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.bottom, 20)
            
        }
        .padding()
        
    }
    
}

#Preview {
    ProjectItemView(projectContainer: ProjectData(), newProject: Project())
}
