//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var moreViewisShowing = false
    @Namespace var nameSpace
    @State private var selectedTab = 1 // to show the middle tab first

    var body: some View {
        NavigationStack{
            
            ZStack{
                
                TabView(selection: $selectedTab){
                    HomeView()
                        .tag(1)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    SearchView()
                        .tag(2)
                        .tabItem {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
                    
                    Projects()
                        .tag(3)
                        .tabItem {
                            Label("TaskHub", systemImage: "plus.app")
                        }
                    
                    SpikeView()
                        .tag(4)
                        .tabItem {
                            Label("ProjectHub", systemImage: "figure.walk.motion.trianglebadge.exclamationmark")
                        }
                    
                
                    ProfileView()
                        .tag(5)
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                    
                }
                .offset(x: moreViewisShowing ? 900 : 0)
                .navigationTitle(selectedTab == 1 ? "Dashboard" : "")
                
                
                MoreView(moreViewisShowing: $moreViewisShowing)
                    .toolbar(moreViewisShowing ? .hidden : .visible, for: .navigationBar)
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.easeIn) {
                            moreViewisShowing.toggle()
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
