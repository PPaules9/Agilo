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
       dateFormatter.dateFormat = "EEEE, dd MMMM" // Format for "Sunday, 28 April"
       return dateFormatter.string(from: currentDate)
     }
    
    
    var body: some View {
        
        //Adjust This line to work
//        if projects == 100 {
//            ContentUnavailableView {
//                Label("Thier is no Projects yet", systemImage: "plus")
//            } description: {
//                Text("You don't have any projects")
//            } actions: {
//                NavigationLink("Create a project now", destination: Add(newProjectPresented: show, item: ProjectManager))
//
//            }
//        } 
//        else {
            
            NavigationStack{
                ScrollView (showsIndicators: false){
                    
                    HStack {
                        Text("\(formattedDate)")
                            .font(.headline)
                            .font(.system(size: 20, design: .monospaced))
                        Spacer()
                    }
                    .padding(.horizontal)

                    
                    ZStack {
                        
                        ActivityRings(lineWidth: 30, backgroundColor: Color.indigo.opacity(0.2), foregroundColor: Color.indigo, percentage: percentage1)
                            .frame(width: 160, height: 160)
                        
                        
                        ActivityRings(lineWidth: 40, backgroundColor: Color.mint.opacity(0.2), foregroundColor: Color.mint, percentage: percentage2)
                            .frame(width: 245, height: 245)
                            
                        ActivityRings(lineWidth: 40, backgroundColor: Color.orange.opacity(0.2), foregroundColor: Color.orange, percentage: percentage3)
                            .frame(width: 330, height: 390)
                            
                    }
                    .onAppear(){
                        withAnimation(.easeIn(duration: 1.2)){
                            self.percentage1 = 100.0 -  Double(Date().percentDayRemaining)
                            self.percentage2 = 30
                            self.percentage3 = 80
                        }
                    }.onReceive(timer) { _ in
                        timeElapsed += 1
                    }
                    HStack{
                        Text("Sprint 2")
                            .font(.system(size: 20, design: .monospaced))
                            .bold()
                            .foregroundColor(.blue)
                            .frame(width: 110, height: 35)
                            .cornerRadius(15)

                        Spacer()
                        Image(systemName: "pencil.and.list.clipboard")
                            .foregroundColor(.blue)
                            .fontDesign(.monospaced)
                            .frame(width: 40, height: 35)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                        Text("SPIKE")
                            .foregroundColor(.blue)
                            .fontDesign(.monospaced)
                            .frame(width: 80, height:35)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                    .padding(.horizontal)

                    Divider()
                    VStack{
                        HStack{
                            ActivityRings(lineWidth: 10, backgroundColor: (colorScheme == .dark ? Color.red : Color.indigo).opacity(0.2), foregroundColor: colorScheme == .dark ? Color.red : Color.indigo, percentage: percentage1)
                                .frame(width: 70, height: 70)
                            
                            VStack(alignment: .leading){
                                Text("Daily Scrum")
                                Text("5h 45m (\(String(format: "%.0f",100.0 -  Double(Date().percentDayRemaining.rounded())))%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            ActivityRings(lineWidth: 10, backgroundColor: Color.mint.opacity(0.2), foregroundColor: Color.teal, percentage: percentage2)
                                .frame(width: 70, height: 70)
                            VStack(alignment: .leading){
                                Text("Sprint Status")
                                Text("Day 4 (35%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            ActivityRings(lineWidth: 10, backgroundColor: Color.orange.opacity(0.2), foregroundColor: Color.orange, percentage: percentage3)
                                .frame(width: 70, height: 70)
                            VStack(alignment: .leading){
                                Text("Product Increment")
                                Text(" 5 out of 10(77%)")
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text(" ✓ DAILY CHECKIN")
                                .font(.custom("Arial", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                                .fontDesign(.monospaced)
                            Spacer()
                        }
                    }
                    .padding(.top)
                    .frame(width: 325, height: 30)
                    
                    
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
                    
                    HStack{
                        ZStack{
                            Capsule()
                                .frame(width: 60, height: 25)
                                .foregroundStyle(Color(.systemGray6))
                            HStack{
                                Image(systemName: "arrowtriangle.right")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                                
                                
                                Text("9")
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
                    
                    Divider()
                    
//                    HorizontalHomeScrollView()
                    
                    //MARK: - Switch Between Projects
                    
                    VStack {
                        Form {
                            Text("Switch between Projects")
                            Text("Change the View based on the current Project")
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
                        
                        
                        //MARK: - MotivationalHomeViewPart
                        
                        MotivationalHomeViewPart()
                        
                    }
                    .frame(width: 350)
                    .padding()
                    
                }
                .padding(.top, 10)
                .background(Color(.orange).blur(radius: 300).opacity(0.2))
            }
            .onAppear {
                  currentDate = Date() // Update on view appearance
            }
        
    }
}

extension Date {
    var percentDayRemaining: Double {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        let secondsInDay = 24.0 * 60 * 60 // Total seconds in a day (using Double)
        let elapsedSeconds = self.timeIntervalSince(startOfDay)

        let percentRemaining = (secondsInDay - elapsedSeconds) / secondsInDay * 100
        return percentRemaining // Return as Double
    }
}


#Preview {
    HomeView()
}
