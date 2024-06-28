import SwiftUI

struct DailyCheckInView: View {
    @State private var streakCount: Int = 0
    @State private var isGreetingVisible = true
    @ObservedObject var projectContainer: ProjectData
    @Binding var newProject: Project
    
    var body: some View {
        
        if let activeProject = projectContainer.getActiveProject() {
            
            VStack(alignment: .leading){
                // Header
                VStack {
                    if isGreetingVisible {
                        HStack {
                            Spacer()
                            Text("\(greeting()), Pavly \(Image(systemName: greetingImage()))")
                                .padding(.top)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .padding(.bottom)
                    } else {
                        HStack {
                            Text("✓ DAILY REFRESH")
                                .font(.custom("Arial", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                                .fontDesign(.monospaced)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isGreetingVisible = false
                        }
                    }
                }
                .padding()
                .frame(width: 300, height: 20)
                
                
                // First Stack (With Conditions related to Sprints) The Current Project Name
                VStack(spacing: 20) {
                    HStack {
                        VStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.01))
                                .frame(width: 2, height: 60)
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.teal.opacity(0.7))

                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 2, height: 80)
                        }
                        .padding(.horizontal, 10)
                        
                        FirstCardStack(imageName: activeProject.symbol, title: activeProject.name, subtitle: "Current Project is", duration: activeProject.deadLine)
                    }
                    
                    // Second Stack (With Conditions related to Sprints)
                    HStack {
                        VStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 2, height: 80)
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.teal.opacity(0.7))
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 2, height: 40)
                        }
                        .padding(.horizontal, 10)
                        
                        CardView(imageName: "hand.wave", title: "God is closer than you may think.", subtitle: "Guided prayer", duration: activeProject.startDay)
                            .onTapGesture{
                                
                            }
                            
                    }
                    
                    // Third Stack (With Conditions related to Sprints)
                    HStack {
                        VStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 2, height: 40)
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.teal.opacity(0.7))
                            Rectangle()
                                .fill(Color.gray.opacity(0.01))
                                .frame(width: 2, height: 60)
                        }
                        .padding(.horizontal, 10)
                        
                        CardView(imageName: "person1", title: "Another card example", subtitle: "Another subtitle", duration: activeProject.deadLine)
                    }
                }
                .padding()
                
                // Streak Section
                HStack {
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .frame(width: 60, height: 25)
                            .foregroundStyle(Color(.systemGray6))
                        HStack {
                            Image(systemName: "arrowtriangle.right")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 12))
                            
                            Text("\(streakCount)") // Updated to use streakCount
                                .font(.custom("Arial", size: 14))
                                .fontDesign(.monospaced)
                        }
                    }
                    HStack {
                        Text("☼")
                            .font(.custom("Arial", size: 15))
                        
                        Text("Daily Streak")
                            .font(.custom("Arial", size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .fontDesign(.monospaced)
                    }
                    Spacer()
                }
                .padding(.bottom, 9)
                .onAppear(perform: checkAndUpdateStreak)
            }
        }
    }
    
    // Check and Update Streak
    func checkAndUpdateStreak() {
        let userDefaults = UserDefaults.standard
        let lastCheckInDateKey = "lastCheckInDate"
        let streakCountKey = "streakCount"
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        if let lastCheckInDate = userDefaults.object(forKey: lastCheckInDateKey) as? Date {
            let daysDifference = calendar.dateComponents([.day], from: lastCheckInDate, to: currentDate).day ?? 0
            
            if daysDifference == 1 {
                streakCount = userDefaults.integer(forKey: streakCountKey) + 1
            } else if daysDifference > 1 {
                streakCount = 1
            } else {
                streakCount = userDefaults.integer(forKey: streakCountKey)
            }
        } else {
            streakCount = 1
        }
        
        userDefaults.set(currentDate, forKey: lastCheckInDateKey)
        userDefaults.set(streakCount, forKey: streakCountKey)
    }
    
    // Greeting Conditions
    func greeting() -> String {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        switch hour {
        case 6..<12:
            return "Good Morning"
        case 12..<17:
            return "It's Afternoon"
        case 17..<22:
            return "Hey 👋"
        default:
            return "Good Night"
        }
    }
    
    // Can be changed later according to weather Conditions
    func greetingImage() -> String {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        switch hour {
        case 6..<12:
            return "sunrise"
        case 12..<17:
            return "sun.max"
        case 17..<22:
            return "sunset"
        default:
            return "moon"
        }
    }
}

#Preview {
    DailyCheckInView(projectContainer: ProjectData(), newProject: .constant(Project()))
}
