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
    @State private var newEvent = BackLog()
    
    @ObservedObject var projectContainer : ProjectData
    @Binding var newProject : Project
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                HomeView(newProject: $newProject, projectContainer: projectContainer)
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
                
                MyProject(projectContainer: projectContainer, newProject: $newProject)
                    .tag(3)
                    .tabItem {
                        Label("My Projects", systemImage: "plus.app")
                            .fontDesign(.monospaced)
                    }
                
                //                backLog()
                //                    .tag(4)
                //                    .tabItem {
                //                        Label("BackLog", systemImage: "doc.plaintext")
                //                            .fontDesign(.monospaced)
                //                    }
                
                ProfileView()
                    .tag(5)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                            .fontDesign(.monospaced)
                    }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if selectedTab != 3 {
                        Button{
                            newEvent = BackLog()
                            isAddingNewProject = true
                        }
                    label: {
                        Image(systemName: "plus.circle")
                    }
                        
                    } else {
                        Button{
                            newEvent = BackLog()
                            isAddingNewProject = true
                        }
                    label: {
                        Image(systemName: "plus.circle")
                    }
                    }
                }
            }
            .sheet(isPresented: $isAddingNewProject){
                NavigationStack{
                    Add(
                        projectContainer: projectContainer
                    )
                    .environmentObject(ProjectData())
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel"){
                                isAddingNewProject = false
                            }
                        }
                    }
                }
            }
            
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.bouncy) {
                            moreViewisShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "gear")
                        
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
                    .offset(x: 5)
                }
            }
        }
    }
}


#Preview {
    MainView(projectContainer: ProjectData(), newProject: .constant(Project()) )
}






