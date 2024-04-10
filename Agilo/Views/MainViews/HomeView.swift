//
//  HomeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct HomeView: View {
    @State var rotation: CGFloat = 0.0

    var body: some View {
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 30){
                    HomeCard()
                    HomeCard()
                    HomeCard()
                    HomeCard()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .padding(.leading)

                Divider()
            }
            
            VStack(alignment: .leading){
                VStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("myGreen2"))
                    Spacer()
                    Divider()
                        .rotationEffect(.degrees(90))
                        .frame(height: 50)
                    
                }
                
            }
            .padding()
            .frame(width:350, height: 200)
            
        }
        .padding(.top, 10)
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
 */
