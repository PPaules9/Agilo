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
                Projects()
                    .tabItem {
                        Label("Projects", systemImage: "calendar.badge.checkmark")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                
                SpikeView()
                    .tabItem {
                        Label("Spike", systemImage: "figure.walk.motion.trianglebadge.exclamationmark")
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
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: ShowMore()) {
                    Image(systemName: "ellipsis.circle")
                    // Menu icon (3 dots)
                }
            }
        }
    }
    }
}

#Preview {
    MainView()
}
