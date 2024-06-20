//
//  HomeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var rotation: CGFloat = 0.0
    @State var show = false
    @Environment(\.colorScheme) var colorScheme
    @State var percentage1: Double = 0.0
    @State var percentage2: Double = 0.0
    @State var percentage3: Double = 0.0
    @State private var timeElapsed = 0 // Start at 0 minutes
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect() // Every 60 seconds (1 minute)
    
    
    @State private var currentDate = Date()
    // Stores current date
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM" // Format for "Sunday, 28 April"
        return dateFormatter.string(from: currentDate)
    }
    
    
    
    
    @Binding var newProject : Project
    @ObservedObject var projectContainer : ProjectData
    
    
    var body: some View {
        
        if let activeProject = projectContainer.getActiveProject() {
            
            NavigationStack{
                ScrollView (showsIndicators: false){
                    
                    //Header
                    HStack {
                        Text("Today")
                            .font(.title2)
                        
                        Text("\(formattedDate)")
                            .font(.headline)
                            .font(.system(size: 22, design: .monospaced))
                            .foregroundStyle(Color(.gray))
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //The 3 Big Cicles
                    ZStack {
                        ActivityRings(lineWidth: 27, backgroundColor: Color.purple1.opacity(0.1), foregroundColor: Color.purple1, percentage: percentage1, percent: 75, startAngle: -99, adjustedSympol: "arrow.triangle.capsulepath")
                            .frame(width: 140, height: 140)
                        
                        
                        ActivityRings(lineWidth: 32, backgroundColor: Color.mint.opacity(0.1), foregroundColor: Color.mint, percentage: percentage2, percent: 75, startAngle: -96, adjustedSympol: "arrow.forward.to.line")
                            .frame(width: 210, height: 210)
                        
                        ActivityRings(lineWidth: 36, backgroundColor: Color.orange.opacity(0.1), foregroundColor: Color.orange, percentage: percentage3, percent: 75, startAngle: -95, adjustedSympol: "shippingbox")
                            .frame(width: 290, height: 360)
                        
                    }
                    .frame(height: 350)
                    .onAppear(){
                        withAnimation(.easeIn(duration: 1.2)){
                            self.percentage1 = 100.0 -  Double(Date().percentDayRemaining)
                            self.percentage2 = 100 - Double(Date.remainingDaysInSprint(from: activeProject.startDay))
                            self.percentage3 = 80
                            
                            print("No of Percentage \(percentage2)")
                        }
                    }
                    .onReceive(timer) { _ in
                        timeElapsed += 1
                    }
                    
                    // Sprint No and Note Taking Section
                    HStack{
                        Text("Sprint \(activeProject.sprint)")
                            .font(.system(size: 20, design: .monospaced))
                            .bold()
                            .foregroundColor(.blue)
                            .frame(width: 110, height: 35)
                            .cornerRadius(15)
                        
                        Spacer()
                        
                        NavigationLink{
                            NotesTaking(newProject: $newProject)
                        } label: {
                            HStack(spacing: 8){
                                Image(systemName: "pencil.and.list.clipboard")
                                Text("Daily Notes")
                            }
                            .foregroundColor(.blue)
                            .fontDesign(.monospaced)
                            .frame(width: 150, height:35)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //Three Small Circles with illustration
                    VStack{
                        HStack{
                            ZStack{
                                ActivityRings(lineWidth: 11, backgroundColor: Color.orange.opacity(0.2), foregroundColor: Color.orange, percentage: percentage3, percent: 75, startAngle: -90, adjustedSympol: "")
                                    .frame(width: 70, height: 70)
                                
                                Image(systemName: "shippingbox")
                                    .foregroundStyle(Color.orange)
                                
                            }
                            VStack(alignment: .leading){
                                Text("Product Increment")
                                Text(" 5 out of 10(77%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            ZStack {
                                ActivityRings(lineWidth: 11, backgroundColor: Color.mint.opacity(0.2), foregroundColor: Color.teal, percentage: percentage2, percent: 75, startAngle: -90, adjustedSympol: "")
                                    .frame(width: 70, height: 70)
                                
                                Image(systemName: "arrow.forward.to.line")
                                    .foregroundStyle(Color.mint)
                            }
                            VStack(alignment: .leading){
                                Text("Sprint Status")
                                
                                Text("Day 4 (35%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            ZStack{
                                ActivityRings(lineWidth: 11, backgroundColor: (colorScheme == .dark ? Color.red : Color.purple1).opacity(0.2), foregroundColor: colorScheme == .dark ? Color.purple1 : Color.purple1, percentage: percentage1, percent: 75, startAngle: -98, adjustedSympol: "")
                                    .frame(width: 70, height: 70)
                                Image(systemName: "arrow.triangle.capsulepath")
                                    .foregroundStyle(Color(colorScheme == .dark ? Color.red : Color.purple1))
                            }
                            VStack(alignment: .leading){
                                Text("Daily Scrum")
                                Text("\(Date().timePassedInDay) (\(String(format: "%.0f",100.0 -  Double(Date().percentDayRemaining.rounded())))%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Divider()
                    
                    DailyChekInView()
                    
                    Divider()
                    //MARK: - Current Project
                    VStack {
                        HStack {
                            Text("Your Current Project")
                                .font(.system(size: 21, design: .monospaced))
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Text("Check out your Previous Notes")
                        
                        Text(activeProject.name)
                        
                        //                        ZStack{
                        //                            if !show {
                        //                                ProjectCardView(namespace: namespace, show: $show)
                        //                            } else {
                        //                                VStack{
                        //                                    ProjectDetailView(namespace: namespace, show: $show)
                        //                                }
                        //                                .frame(height: 640)
                        //                            }
                        //                        }
                        //                        .onTapGesture {
                        //                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        //                                show.toggle()
                        //                            }
                        //                        }
                    }
                    
                    Text("Change your Project from here")
                        .font(.system(size: 42, design: .monospaced))
                    
                    
                    
                    Divider()
                    
                    //                    HorizontalHomeScrollView()
                    
                    //MARK: - Switch Between Projects
                    
                    VStack {
                        Form {
                            Text("Switch between Projects")
                            Text("Change the View based on the current Project")
                            
                            Picker("Select your Project", selection: $newProject.selected){
                                ForEach(projectContainer.projects) { newProject  in
                                    Text(newProject.name)
                                }
                            }
                        }
                        .fontDesign(.monospaced)
                        
                        
                    }
                    .frame(width: 350, height: 200)
                    
                    VStack {
                        Form {
                            Text("Complete View")
                            Text("Complete View")
                            Text("Complete View")
                        }
                        .fontDesign(.monospaced)
                        
                        HorizontalHomeScrollView(projectContainer: projectContainer)
                        
                        //MARK: - MotivationalHomeViewPart
                        
                        MotivationalHomeViewPart()
                        
                    }
                    .frame(width: 350)
                    .padding()
                    
                }
                .padding(.top, 10)
                
            }
            .onAppear {
                currentDate = Date() // Update on view appearance
            }
        } else {
            ContentUnavailableView {
                Label("Thier is no active projects yet", systemImage: "plus")
            } description: {
                Text("You don't have any projects")
            }
        }
    }
}

extension Date {
    //How many time remianing in a day %age
    var percentDayRemaining: Double {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        let secondsInDay = 24.0 * 60 * 60 // Total seconds in a day (using Double)
        let elapsedSeconds = self.timeIntervalSince(startOfDay)
        
        let percentRemaining = (secondsInDay - elapsedSeconds) / secondsInDay * 100
        return percentRemaining // Return as Double
    }
    
    //How much time passed
    var timePassedInDay: String {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        let elapsedSeconds = self.timeIntervalSince(startOfDay)
        
        let hours = Int(elapsedSeconds) / 3600
        let minutes = (Int(elapsedSeconds) % 3600) / 60
        
        return "\(hours)h \(minutes)m"
        
    }
    
    static func remainingDaysInSprint(from startDate: Date) -> Int {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: startDate)
        let twoWeeksInSeconds: TimeInterval = 14.0 * 24 * 60 * 60 // Total seconds in two weeks
        
        let totalSprintDays: Double = 14.0 // Total days in a two-week sprint

        // Calculate the elapsed time from the start of the given date to now
        let now = Date()
        let elapsedSecondsFromStartOfDay = now.timeIntervalSince(startOfDay)
        
        // Calculate the remaining seconds
        let remainingSeconds = twoWeeksInSeconds - elapsedSecondsFromStartOfDay
        
        // Convert remaining seconds to remaining days
        let remainingDays = Int(remainingSeconds / (24 * 60 * 60))
        
        let percentageRemaining = (Double(remainingDays) / totalSprintDays) * 100

        
        return Int(percentageRemaining)
        
    }
}


#Preview {
    HomeView(newProject: .constant(Project()), projectContainer: ProjectData())
}
