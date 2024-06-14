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
    @State private var projectContainer = ProjectData()
    @State private var newProject = Project(id: UUID(), name: "", activated: false)
    
    
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
                    
                    Projects()
                        .tag(3)
                        .tabItem {
                            Label("Projects", systemImage: "plus.app")
                                .fontDesign(.monospaced)
                            
                        }
                    
                    backLog()
                    backLog(eventData: ProjectData())
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
                    Button{
                        newEvent = Event()
                        isAddingNewEvent = true                    }
                    label: {
                    Image(systemName: "plus.circle")
                    
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
<<<<<<< HEAD
                    Add()
=======
                    Add(eventData: eventData, event: $newEvent, isNew: true)
                        .environmentObject(EventData())
>>>>>>> parent of 010b0fa (Making the Project Container)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel"){
                                    isAddingNewEvent = false
                                }
                            }
                            ToolbarItem {
                                Button {
                                    eventData.add(newEvent)
                                    isAddingNewEvent = false
                                } label: {
                                    Text ("Add")
                                }
                                .disabled(newEvent.title.isEmpty)
                            }
                        }
                }
            }
        }
    }
}
#Preview {

    MainView()
}




