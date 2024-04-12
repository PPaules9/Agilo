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
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30){
                        CurrentProject()
                        HomeCard()
                        ProgressChart()
                        EnergyLevelChart()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(.leading)
                    
                    Divider()
                }
                
                VStack(alignment: .leading){
                    HStack {
                        Text("DAILY CHECKIN")
                            .font(.custom("Arial", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
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
                            .foregroundColor(Color("myGreen2"))
                        Spacer()
                    }
                    .frame(width: 25, height: 200)
                    
                    VStack{
                        Text("Unlock All Features")
                            .font(.custom("Charter", size: 16))
                            .foregroundStyle(.white)
                        
                        Text("Pro Agilo Manger")
                            .font(.custom("Charter", size: 22))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 320, height: 300)
                    .background(.cyan)
                    .cornerRadius(20)
                    Spacer()
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
                            .foregroundColor(Color(.systemGray3))
                        Spacer()
                    }
                    .frame(width: 25, height: 200)
                    
                    VStack{
                        Text("Unlock All Features")
                            .font(.custom("Charter", size: 16))
                            .foregroundStyle(.white)
                        
                        Text("Pro Agilo Manger")
                            .font(.custom("Charter", size: 22))
                            .foregroundStyle(.white)
                            .bold()
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
                            .foregroundColor(Color(.systemGray3))
                        Spacer()
                    }
                    .frame(width: 25, height: 200)
                    
                    VStack{
                        Text("Unlock All Features")
                            .font(.custom("Charter", size: 16))
                            .foregroundStyle(.white)
                        
                        Text("Pro Agilo Manger")
                            .font(.custom("Charter", size: 22))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 320, height: 130)
                    .background(Color(.purple1))
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
                            
                            Text("9")
                                .font(.custom("Arial", size: 14))
                            
                        }
                    }
                    Text("Daily Streak")
                        .font(.custom("Arial", size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                }
                .padding(.bottom, 9)
                
                HStack {
                    ZStack{
                        if !show {
                            ProjectCardView(namespace: namespace, show: $show)
                        } else {
                            VStack{
                            ProjectDetailView(namespace: namespace, show: $show)
                        }
                        .frame(height: 600)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            show.toggle()
                        }
                    }
                    
                    
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    
                    Text("Complete View")
                    Text("Complete View")
                    Text("Complete View")
                    
                }
                .frame(width: 350)
                .padding()
                
            }
            .padding(.top, 10)
        }
        
    }
}

#Preview {
    HomeView()
}

/*
 Home View: This tab could display key information about the active project, such as sprint progress, upcoming tasks, and any important notifications. Users can easily access vital project details at a glance.
 
 **Home View**:
 - **Project Overview**: Display a summary of the active project, including its name, current sprint details (such as sprint number, start date, end date), and overall progress indicators (e.g., completion percentage, burndown chart).
 - **Upcoming Tasks**: Show a list of tasks scheduled for the current sprint, sorted by priority or due date. Include options for users to mark tasks as complete, update task details, or add new tasks directly from this view.
 - **Notifications**: Provide notifications for important updates, such as new task assignments, sprint changes, or upcoming meetings. Users can review and dismiss notifications to stay informed about project activities.
 
 sprint progress, upcoming tasks, and any important notifications. Users can easily access vital project details at a glance.
 
 - **Active Project Card:** Display key information about the current project:
 - Project Name
 - Sprint Information (Current Sprint Number & Remaining Days)
 - Quick access button to view the "Product Backlog" for this project.
 - Progress bar indicating completion of the current Sprint (optional).
 - Button to navigate to the detailed "Project View".
 
 */
