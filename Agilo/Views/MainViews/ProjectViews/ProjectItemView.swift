import SwiftUI

struct ProjectItemView: View {
    var newProject: Project
    @State var show = false
    
//    @State private var suggestions: String = ""
//    @State private var isLoading: Bool = false
//    let openAIService = OpenAIService()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(newProject.name)
                .font(.largeTitle)
                .bold()
            
            // Add more project details here as needed
            Text("Symbol: \(newProject.symbol)")
            // Add other details if available, e.g., project.deadline
            
            Spacer()
            
//            Button("Get Task Suggestions") {
//                fetchTaskSuggestions()
//            }
//            .padding()
//            
//            if isLoading {
//                ProgressView()
//                    .padding()
//            } else {
//                Text(suggestions)
//                    .padding()
//            }
            

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
    
    
    
//    func fetchTaskSuggestions() {
//            isLoading = true
//            openAIService.suggestNextTasks(for: newProject) { result in
//                DispatchQueue.main.async {
//                    isLoading = false
//                    switch result {
//                    case .success(let response):
//                        suggestions = response
//                    case .failure(let error):
//                        suggestions = "Error: \(error.localizedDescription)"
//                    }
//                }
//            }
//        }
    
    
    
    
}

#Preview {
    ProjectItemView(newProject: Project())
}
