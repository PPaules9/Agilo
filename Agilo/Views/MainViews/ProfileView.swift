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
                            VStack(alignment: .leading, spacing: 5){
                                HStack{
                                    Text("Pavly Alkess")
                                    Spacer()
                                    Text("Change Name")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Email@gmail.com")
                                    Spacer()
                                    Text("Edit Email")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Password")
                                    Spacer()
                                    Text("Edit Password")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Your phone Number")
                                    Spacer()
                                    Text("01277745591")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Member since")
                                    Spacer()
                                    Text("15 May 2024")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Account ID")
                                    Spacer()
                                    Text("343sd345")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
                                HStack{
                                    Text("Go to My Projects")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 11)
                                
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
    ProfileView()
}


