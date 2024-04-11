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
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                                
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
                    
                    MoreView(moreViewisShowing: $moreViewisShowing)
                        .tabItem {
                            Label("More", systemImage: "line.3.horizontal")
                        }
                }
                .offset(x: moreViewisShowing ? 400 : 0)
                    
                MoreView(moreViewisShowing: $moreViewisShowing)
                      .transition(.slide)
                      .toolbar(moreViewisShowing ? .hidden : .visible, for: .navigationBar)
            }
            
//            .toolbar(moreViewisShowing ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.easeIn) {
                            moreViewisShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "person.crop.circle")
                    })
                }
            }
        }
    }
}

#Preview {
    MainView()
}
