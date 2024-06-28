import SwiftUI

struct Add: View {
    @ObservedObject var projectContainer: ProjectData
    @State private var newProject = Project()
    @State private var newTeamMember = ""
    @State private var isPickingSymbol = false
    @State private var currentIndex = 0
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient ignoring the safe area
                RadialGradient(
                    gradient: Gradient(colors: [
                        colorScheme == .dark ? Color.black : Color.white,
                        Color.orange
                    ]),
                    center: .top,
                    startRadius: 10,
                    endRadius: UIScreen.main.bounds.height / 1
                )
                .edgesIgnoringSafeArea(.all)
                
                // Content respecting the safe area
                VStack {
                    TabView(selection: $currentIndex) {
                        AddProjectNameView(newProject: $newProject, isPickingSymbol: $isPickingSymbol)
                            .tag(0)
                            .tabItem {
                                Label("Name", systemImage: "1.circle")
                            }
                        
                        AddDatesView(newProject: $newProject)
                            .tag(1)
                            .tabItem {
                                Label("Dates", systemImage: "2.circle")
                            }
                        
                        AddDetailsView(newProject: $newProject, newTeamMember: $newTeamMember)
                            .tag(2)
                            .tabItem {
                                Label("Details", systemImage: "3.circle")
                            }
                        
                        AddSprintsView(newProject: $newProject)
                            .tag(3)
                            .tabItem {
                                Label("Sprints", systemImage: "4.circle")
                            }
                        
                        ActivateProjectView(newProject: $newProject, projectContainer: projectContainer)
                            .tag(4)
                            .tabItem {
                                Label("Activate", systemImage: "5.circle")
                            }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .sheet(isPresented: $isPickingSymbol) {
                        SymbolPicker(newProject: $newProject)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                    HStack {
                        if currentIndex > 0 {
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    currentIndex -= 1
                                }
                            }) {
                                Text("Previous")
                            }
                            .padding()
                        }
                        
                        Spacer()
                        
                        if currentIndex < 4 {
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    currentIndex += 1
                                }
                            }) {
                                Text("Next")
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Add(projectContainer: ProjectData())
        .environmentObject(ProjectData())
}
