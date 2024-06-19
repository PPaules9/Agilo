import SwiftUI

struct ProjectItemView: View {
    var newProject: Project
    @State var show = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(newProject.name)
                .font(.largeTitle)
                .bold()
            
            // Add more project details here as needed
            Text("Symbol: \(newProject.symbol)")
            // Add other details if available, e.g., project.deadline
            
            Spacer()
            

        }
        .padding()
        .navigationTitle("Project Details")
        
        
        ZStack{
            if !show {
                ProjectCardView()
                
            } else {
                VStack{
                ProjectCardView()
                }
                .frame(height: 650)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    ProjectItemView(newProject: Project())
}
