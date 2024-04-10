//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var profileViewisShowing = false
    @Namespace var nameSpace
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                Divider()
                TabView {
                    
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    Projects()
                        .tabItem {
                            Label("TaskHub", systemImage: "calendar.badge.checkmark")
                        }
                    
                    SpikeView()
                        .tabItem {
                            Label("Spike", systemImage: "figure.walk.motion.trianglebadge.exclamationmark")
                        }
                    
                    ProfileView(profileViewisShowing: $profileViewisShowing)
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
                        } .onTapGesture {
                            profileViewisShowing = true
                        }
                }
                .cornerRadius(profileViewisShowing ? 20 : 10)
                .offset(x: profileViewisShowing ? 300 : 0, y: profileViewisShowing ? 45 : 0)
                
                ProfileView(profileViewisShowing: $profileViewisShowing)
                
            }
            
            .toolbar(profileViewisShowing ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.spring()) {
                            profileViewisShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
        }
    }
}

#Preview {
    MainView()
}
