//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var moreViewisShowing = false
    @State private var selectedTab = 1
    @State private var isAddingNewProject = false
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var projectContainer : ProjectData
    @State private var selectedProject: Project = Project()
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                HomeView(newProject: $selectedProject, projectContainer: projectContainer)
                    .background(colorScheme == .dark ? Color("c") : Color.white)
                    .tag(1)
                    .tabItem {
                        Label("Home", systemImage: "house")
                            .fontDesign(.monospaced)
                    }

                
                //                SearchView(capsuleText: "")
                //                    .tag(2)
                //                    .tabItem {
                //                        Label("Explore", systemImage: "magnifyingglass")
                //                            .fontDesign(.monospaced)
                //                    }
                
                ProjectsView(projectContainer: projectContainer, newProject: $selectedProject)
                    .background(colorScheme == .dark ? Color("c") : Color.white)
                    .tag(3)
                    .tabItem {
                        Label("Projects", systemImage: "plus.app")
                            .fontDesign(.monospaced)
                    }
                
                BacklogView(projectContainer: projectContainer)
                    .background(colorScheme == .dark ? Color("c") : Color.white)
                    .tag(4)
                    .tabItem {
                        Label("BackLog", systemImage: "doc.plaintext")
                            .fontDesign(.monospaced)
                    }
                
                ProfileView(projectContainer: projectContainer)
                    .background(colorScheme == .dark ? Color("c") : Color.white)
                    .tag(5)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                            .fontDesign(.monospaced)
                    }
            }

            .toolbar {
                // Settings
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.bouncy) {
                            moreViewisShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "gear")
                        
                    }).sheet(isPresented: $moreViewisShowing){
                        MoreView()
                            .background(colorScheme == .dark ? Color("c") : Color.white)
                    }
                }
                
                // Agilo Word
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Text("Agi")
                            .bold()
                        Text("lo")
                            .bold()
                            .foregroundStyle(Color(.orange))
                            .offset(x: -8)
                    }
                    .offset(x: 5)
                }
                
                // Recap Button
                ToolbarItem(placement: .topBarTrailing) {
                    if selectedTab == 5 {
                        Button{
                            
                        }
                    label: {
                        Image(systemName: "fireworks")
                    }
                    }
                }
                
                // Chart Button
                ToolbarItem(placement: .topBarTrailing) {
                    if selectedTab == 5 {
                        Text("")
                    } else {
                        Button{
                            //Adjusting Charts and analysis
                        }
                    label: {
                        Image(systemName: "chart.bar.xaxis")
                    }
                    }
                }
                
                // Add Project
                ToolbarItem(placement: .topBarTrailing) {
                    if selectedTab == 5 {
                        Text("")
                    } else {
                        Button{
                            isAddingNewProject = true
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            }
            NavigationLink(destination: Add(projectContainer: projectContainer)
                .environmentObject(ProjectData()), isActive: $isAddingNewProject) {
                    EmptyView()
                }
        }
    }
}


#Preview {
    MainView(projectContainer: ProjectData())
}






