//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct MyProjects: View {
    
    @Namespace var namespace
    @Namespace var namespace1
    @State var show = false
    @State var show2 = false
    @State var project = 0
    @State private var counter = 0

        var body: some View {
            NavigationStack{
                ScrollView(showsIndicators: false){
                    HStack {
                        ZStack{
                            if !show {
                                ProjectCardView(namespace: namespace, show: $show)
                                
                            } else {
                                VStack{
                                    ProjectDetailView(namespace: namespace, show: $show)
                                }
                                .frame(height: 650)
                            }
                        }
                        .onTapGesture {
                            counter += 1
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                        
                    }
                    .sensoryFeedback(.impact(weight: .heavy, intensity: 100), trigger: counter)
                    
                    
                    HStack {
                        ZStack{
                            if !show2 {
                                trial1(namespace: namespace1, show: $show2)
                                
                            } else {
                                VStack{
                                    trial2(namespace: namespace1, show: $show2)
                                }
                                .frame(height: 650)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show2.toggle()
                            }
                        }
                        
                    }
                }
            }

    }
    
}
#Preview {
    MyProjects()
}

/*
 Spike View: This tab provides quick access to manage emergencies or changes within the sprint. Users can initiate spike sessions, adjust tasks, or hold emergency meetings directly from this tab. It’s a focused space for addressing unexpected issues and maintaining agility in project management.
 
 **Spike View**:
    - **Emergency Tasks**: Present a streamlined interface for handling emergency tasks or changes within the sprint. Allow users to quickly add new tasks, modify existing tasks, or reprioritize backlog items in response to urgent issues.
    - **Spike Sessions**: Facilitate spike sessions or emergency meetings by providing tools for scheduling, inviting participants, and documenting discussions and decisions. Include options for recording meeting minutes and assigning action items to team members.
    - **Real-time Collaboration**: Support real-time collaboration among team members during spike sessions, allowing participants to share updates, discuss solutions, and make decisions collaboratively.
    - **Escalation Alerts**: Implement notification mechanisms to alert relevant stakeholders about spike sessions or urgent issues, ensuring timely response and resolution of critical project concerns.
 
 his tab provides quick access to manage emergencies or changes within the sprint. Users can initiate spike sessions, adjust tasks, or hold emergency meetings directly from this tab. It’s a focused space for addressing unexpected issues and maintaining agility in project management.
 Initiate a quick "Spike" meeting for urgent changes.
 
 - **Spike:** (Optional, can also be a separate tab)
     - A quick form to propose a change to the current Sprint Backlog.
     - Briefly describe the change and its impact.
     - Option to propose adding a new user story or task.
     - Submit the proposal for review and discussion during the next Daily Scrum or a dedicated Spike meeting.
 */

