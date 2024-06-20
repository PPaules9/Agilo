//
//
////MY Private API KEY private let apiKey = "sk-proj-wxDWj2IYHN71OhAhlCggT3BlbkFJbjMeGLaf9XsF6NRV1Nr5"
//
//
//
//import Foundation
//import SwiftUI
//
//struct ChatView: View {
//    @State private var userInput: String = ""
//    @State private var chatResponse: String = ""
//    @State private var isLoading: Bool = false
//
//    let openAIService = OpenAIService()
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                Text(chatResponse)
//                    .padding()
//            }
//            TextField("Ask me anything about your project...", text: $userInput)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .padding()
//            if isLoading {
//                ProgressView()
//                    .padding()
//            } else {
//                Button("Send") {
//                    sendPrompt()
//                }
//                .padding()
//            }
//        }
//        .navigationTitle("Project Assistant")
//    }
//
//    func sendPrompt() {
//        isLoading = true
//        openAIService.sendPrompt(prompt: userInput) { result in
//            DispatchQueue.main.async {
//                isLoading = false
//                switch result {
//                case .success(let response):
//                    chatResponse = response
//                case .failure(let error):
//                    chatResponse = "Error: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//
//
//
//
//struct OpenAIService {
//    private let apiKey = "YOUR_API_KEY"
//    private let endpoint = "https://api.openai.com/v1/engines/text-davinci-003/completions"
//
//
//    func sendPrompt(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
//        guard let url = URL(string: endpoint) else {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let parameters: [String: Any] = [
//            "prompt": prompt,
//            "max_tokens": 100
//        ]
//
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid parameters"])))
//            return
//        }
//
//        request.httpBody = httpBody
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                   let choices = json["choices"] as? [[String: Any]],
//                   let text = choices.first?["text"] as? String {
//                    completion(.success(text))
//                } else {
//                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
//                }
//            } catch {
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    }
//    
//    func suggestNextTasks(for project: Project, completion: @escaping (Result<String, Error>) -> Void) {
//        let prompt = """
//        Based on the following project details, suggest the next tasks or milestones:
//        Project Name: \(project.name)
//        Current Sprint: \(project.sprint)
//        Deadline: \(project.deadLine)
//        Backlog Milestones: \(project.backlogMilestone.map { $0.title }.joined(separator: ", "))
//        Current Notes: \(project.notes.joined(separator: ", "))
//        """
//        
//        sendPrompt(prompt: prompt, completion: completion)
//    }
//}
