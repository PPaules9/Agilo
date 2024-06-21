import SwiftUI

struct DailyChekInView: View {
    @State private var streakCount: Int = 0

    var body: some View {
        
        //Header
        VStack(alignment: .leading){
            
            HStack{
                Spacer()
                Text("\(greeting()), Pavly \(Image(systemName: greetingImage()))")
                Spacer()
            }
            .padding(.bottom, 10)
            HStack {
                Text(" ✓ DAILY REFRESH")
                    .font(.custom("Arial", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .fontDesign(.monospaced)
                Spacer()
            }
        }
        .padding(.top)
        .frame(width: 325, height: 30)
        
        
        //First Stack (The Big One)
        HStack {
            VStack{
                Spacer()
                Divider()
                    .rotationEffect(.degrees(90))
                    .frame(width: 240)
                    .offset(y: 130)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.teal.opacity(2)))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Daily Tasks")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                Text("Task 1")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 2")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 3")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 4")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                
            }
            .frame(width: 320, height: 300)
            .background(Color(.orange.opacity(0.7)))
            .cornerRadius(20)
            
        }
        .padding(.top)
        .padding(.horizontal)
        .frame(width: 380)
        
        
        //Second Stack (With Conditions related to Sprints)
        HStack {
            VStack{
                Spacer()
                Divider()
                    .rotationEffect(.degrees(90))
                    .frame(width: 130)
                    .offset(y: 90)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray6))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Take Notes for the Daily Scrum Meeting")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                Text("13 Days till the end of current Sprint")
                    .font(.custom("Charter", size: 12))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                    .padding()
                    .frame(height: 30)
            }
            .frame(width: 320, height: 130)
            .background(Color(.purple1))
            .cornerRadius(20)
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: 380, height: 160)
        
        
        //Third Stack (With Conditions related to Sprints)
        HStack {
            VStack{
                Spacer()
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray6))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Do A Spike !")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                Text("Take notes for your spike")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                
            }
            .frame(width: 320, height: 130)
            .background(Color(.indigo.opacity(0.7)))
            .cornerRadius(20)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom)
        .frame(width: 380, height: 140)
        
        
        
        //Streak Section
        HStack{
            ZStack{
                Capsule()
                    .frame(width: 60, height: 25)
                    .foregroundStyle(Color(.systemGray6))
                HStack{
                    Image(systemName: "arrowtriangle.right")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    
                    Text("\(streakCount)") // Updated to use streakCount
                        .font(.custom("Arial", size: 14))
                        .fontDesign(.monospaced)
                }
            }
            HStack{
                Text(" ☼")
                    .font(.custom("Arial", size: 15))

                Text("Daily Streak")
                    .font(.custom("Arial", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .fontDesign(.monospaced)
            }
            
        }
        .padding(.bottom, 9)
        .onAppear(perform: checkAndUpdateStreak)
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
    
    //greeting Conditions
    func greeting() -> String {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        switch hour {
        case 6..<12:
            return "Good Morning "
        case 12..<17:
            return "It's Afternoon"
        case 17..<22:
            return "Catch Remaining Tasks"
        default:
            return "Good Night"
        }
    }
    
    //Can be changed later according to weather Conditions
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
    DailyChekInView()
}
