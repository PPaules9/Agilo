//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var moreViewisShowing = false
    @State private var exploreViewisShowing = false
    @Namespace var nameSpace
    @State private var selectedTab = 1 // to show the middle tab first
    @State private var searchProject = ""
    @Binding var projects: Int
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                TabView(selection: $selectedTab){
                    HomeView(projects: $projects)
                        .tag(1)
                        .tabItem {
                            Label("Home", systemImage: "house")
                                .fontDesign(.monospaced)
                        }
                    
                    SearchView(capsuleText: "")
                        .tag(2)
                        .tabItem {
                            Label("Explore", systemImage: "magnifyingglass")
                                .fontDesign(.monospaced)
                            
                        }
                        .toolbar(exploreViewisShowing ? .hidden : .visible, for: .navigationBar)
                    
                    AddProjects(projects: $projects)
                        .tag(3)
                        .tabItem {
                            Label("Add", systemImage: "plus.app")
                                .fontDesign(.monospaced)
                            
                        }
                    
                    MyProjects()
                        .tag(4)
                        .tabItem {
                            Label("Projects", systemImage: "doc.plaintext")
                                .fontDesign(.monospaced)
                            
                        }
                    
                    ProfileView()
                        .tag(5)
                        .tabItem {
                            Label("Profile", systemImage: "person")
                                .fontDesign(.monospaced)
                            
                        }
                    
                }
                //                .offset(x: moreViewisShowing ? 900 : 0)
                //                .navigationTitle("")
                //                .navigationTitle(selectedTab == 1 ? "Dashboard"
                // : (selectedTab == 2 ? "Explore" : (selectedTab == 3 ? "Add Project" : (selectedTab == 4 ? "Projects" : "Profile"))))
                
                
                //                MoreView(moreViewisShowing: $moreViewisShowing)
                //                    .toolbar(moreViewisShowing ? .hidden : .visible, for: .navigationBar)
                
                
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddProjects(projects: $projects),
                        label: {
                        Image(systemName: "plus.circle")
                        
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.bouncy) {
                            moreViewisShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    }).sheet(isPresented: $moreViewisShowing){
                        MoreView()
                    }
                    
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Text("Agi")
                            .bold()
                        Text("lo")
                            .bold()
                            .foregroundStyle(Color(.orange))
                            .offset(x: -8)
                        
                    }
                    
                }
                
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView(projects: .constant(0))
}
