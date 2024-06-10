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
    @State private var isAddingNewEvent = false
    @State private var newEvent = BackLog()
    @ObservedObject var eventData: BackLogData
    
    @ObservedObject var projectContainer : ProjectData
    @State private var newProject = Project(id: UUID(), name: "", activated: false, backlogData: BackLogData())
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                TabView(selection: $selectedTab){
                    HomeView()
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
                    
                    Projects( projectContainer: ProjectData())
                        .tag(3)
                        .tabItem {
                            Label("Project", systemImage: "plus.app")
                                .fontDesign(.monospaced)
                            
                        }
                    
                    backLog(eventData: BackLogData())
                        .tag(4)
                        .tabItem {
                            Label("BackLog", systemImage: "doc.plaintext")
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
                    if selectedTab != 4 {
                        Button{
                            newEvent = BackLog()
                            isAddingNewEvent = true                    }
                        label: {
                        Image(systemName: "plus.circle")
                        }
                        
                    }else {
                        Button{
                            newEvent = BackLog()
                            isAddingNewEvent = true                    }
                        label: {
                        Text("Edit")
                        }
                    }
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
                    //                    .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
                }
            }
            .sheet(isPresented: $isAddingNewEvent){
                NavigationStack{
                    Add(
                        projectContainer: ProjectData()
                    )
                        .environmentObject(ProjectData())
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel"){
                                    isAddingNewEvent = false
                                }
                            }
                            ToolbarItem {
                                Button {
                                    projectContainer.add(newProject)
                                    isAddingNewEvent = false
                                } label: {
                                    Text ("Add")
                                }
                            }
                        }
                }
            }
        }
    }
}


#Preview {
    MainView(eventData: BackLogData(), projectContainer: ProjectData()
             )
}




