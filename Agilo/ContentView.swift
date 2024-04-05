import SwiftUI
// Class definition
class User1 {
  var name: String
  var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

// Parent View
struct ParentView: View {
    @State private var user = User1(name: "John Doe", email: "johndoe@example.com")
    
    var body: some View {
        VStack {
            Text("User: \(user.name)")
            Button("Change Name") {
                user.name = "Jane Doe" // Modify the original object
            }
            ChildView(user: user) // Pass the reference
        }
    }
}
// Child View
struct ChildView: View {
    let user: User1 // Receive the reference
    
    var body: some View {
        Text("Name in Child View: \(user.name)")
    }
}
#Preview {
    ParentView()
}
