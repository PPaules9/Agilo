//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var showMenu = false
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
                
                ProfileView(isShowing: $showMenu)
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    } .onTapGesture {
                        showMenu = true
                    }
            }
            
            ProfileView(isShowing: $showMenu)
            
        }
        
        .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    showMenu.toggle()
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
