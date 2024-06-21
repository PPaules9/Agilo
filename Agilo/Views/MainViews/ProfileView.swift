//
//  ShowMore.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    var iconBackgroundColor: Color {
        colorScheme == .light ? Color("c") : .gray
    }
    
    @ObservedObject var projectContainer: ProjectData
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                
                VStack(spacing:5) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal)
                    Text("Pavly Paules")
                        .font(.custom("Charter", size: 22))
                        .bold()
                        .padding(.bottom)
                    
                    Button{
                        //Subscribe Button
                    } label: {
                        HStack{
                            VStack(alignment: .leading, spacing: 10){
                                Text("Want More Projects?")
                                    .font(.custom("Charter", size: 16))
                                    .foregroundStyle(Color("c"))
                                    .fontDesign(.monospaced)
                                
                                Text("UPGRADE TO PREMIUM NOW")
                                    .font(.custom("Charter", size: 19))
                                    .foregroundStyle(Color("c"))
                                    .bold()
                                    .fontDesign(.monospaced)
                                
                            }
                            .padding(.leading)
                            
                            Spacer()
                            Image(systemName: "control")
                                .rotationEffect(.degrees(90))
                                .padding(.horizontal, 7)
                                .foregroundStyle(iconBackgroundColor)
                        }
                    }
                    .frame(width: 340, height: 90)
                    .background(.orange.opacity(0.5))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    Divider()
                    
                    Spacer()
                    
                    ZStack{
                        
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .cornerRadius(20)
                            .frame(width: 360, height: 410)
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 25){
                                
                                Button{
                                } label: {
                                    ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Pavly Alkess", tintColor: Color.blue, goTo: "Change Name")
                                }
                                Button{
                                } label: {
                                    ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Email@gmail.com", tintColor: Color.blue, goTo: "Change Email")
                                }
                                Button{
                                } label: {
                                    ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Password", tintColor: Color.blue, goTo: "Edit Password")
                                }
                                ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Phone Number", tintColor: Color.blue, goTo: "01277745591")
                                
                                
                                ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Member since", tintColor: Color.blue, goTo: "15 May 2024")
                                
                                ProfileViewModel(lastItem: false, imageName: "person.circle", title: "Account ID", tintColor: Color.blue, goTo: "dsahijo54kln")
                                
                                
                                HStack{
                                    Text("Your Active Project is ")
                                }
                                .padding(.horizontal, 30)
                                
                                HStack{
                                    Text("Invite a Friend and get 1 month Free")
                                }
                                .frame(width: 340, height: 15)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .cornerRadius(15)
                                
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(.top, 10)
    }
}


#Preview {
    ProfileView(projectContainer: ProjectData())
}


