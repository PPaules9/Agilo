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
                        .frame(width: 100, height: 100)
                        .padding()
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
                    
                    
                    
                    
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            HStack{
                                Text("Pavly Alkess")
                                Spacer()
                                Text("Change Name")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Email@gmail.com")
                                Spacer()
                                Text("Edit Email")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Password")
                                Spacer()
                                Text("Edit Password")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Your phone Number")
                                Spacer()
                                Text("01277745591")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Member since")
                                Spacer()
                                Text("15 May 2024")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Account ID")
                                Spacer()
                                Text("343sd345")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            HStack{
                                Text("Go to My Projects")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .background(Color(.myGreen1))
                            .cornerRadius(15)
                            
                            
                            HStack{
                                Text("Invite a Friend and get 1 month Free")
                            }
                            .frame(width: 340, height: 15)
                            .padding()
                            .cornerRadius(15)
                            
                        }
                        Spacer()
                        
                    }
                    .padding()
                    
                    Spacer()
                }
                
            }
        }
        .padding(.top, 10)
    }
}


#Preview {
    ProfileView()
}


