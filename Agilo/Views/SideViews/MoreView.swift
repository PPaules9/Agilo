//
//  ProfileView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI


struct MoreView: View {
    @State private var appVersion = "1.0.0"

    @Binding var moreViewisShowing: Bool
    @State private var showProfileView = false
    @State private var showSettings = false
    
    @Environment(\.colorScheme) var colorScheme
    
    let lightGradient = LinearGradient(gradient: Gradient(colors: [Color("Purple2"), Color("ib")]),
                                       startPoint: .top,
                                       endPoint: UnitPoint(x: 2, y: 1.2))
    
    let darkGradient = LinearGradient(gradient: Gradient(colors: [Color("c"), Color("Purple2")]), startPoint: UnitPoint(x: 2, y: 0.8), endPoint: UnitPoint(x: 2, y: 2))
    
    var profileBackgroundColor: LinearGradient {
        colorScheme == .light ? lightGradient : darkGradient
    }
    
    var iconBackgroundColor: Color {
        colorScheme == .light ? Color("c") : .gray
    }
    
    var body: some View {
        if moreViewisShowing {
            
            ZStack(alignment: .topTrailing){
                
                //for Testing Puroses only
                let testUser = User(id: NSUUID().uuidString, fullName: "Pavly Paules", email:"test@gmail.com")
                
                //UnComment this
                //if let user = viewModel.currentUser {
                
                HStack {
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 29){
                            HStack{
                                Button(action:  {
                                    //show ProfileView by boolean
                                    showProfileView = true
                                }, label:{
                                    Text(testUser.initials)
                                        .font(.custom("Charter", size: 30))
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(width: 75, height: 75)
                                        .background(Color(.systemGray3))
                                        .clipShape(Circle())
                                })
                                
                                VStack (alignment: .leading, spacing: 4 ){
                                    
                                    Text(testUser.fullName)
                                        .font(.custom("Charter", size: 18))
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                    
                                    Text(testUser.email)
                                        .font(.custom("Charter", size: 16))
                                        .font(.footnote)
                                        .foregroundStyle(.tint)
                                    
                                }
                                
                            }
                            .padding(.top)
                            
                            //If User Unsubscribed
                            Button{
                                //Subscribe Button
                            } label: {
                                HStack{
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Unlock All Features")
                                            .font(.custom("Charter", size: 18))
                                            .foregroundStyle(.white)
                                        
                                        Text("Pro Agilo Manger")
                                            .font(.custom("Charter", size: 24))
                                            .foregroundStyle(.white)
                                            .bold()
                                    }
                                    .padding(.leading)
                                    
                                    Spacer()
                                }

                            }
                            .frame(width: 340, height: 100)
                            .background(.cyan)
                            .cornerRadius(15)
                            .shadow(radius: 2)

                            
                            Button{
                                showSettings.toggle()
                            } label: {
                                SettingRow(imageName: "gear", title: "Settings", tintColor: .blue)
                            }.sheet(isPresented: $showSettings){
                                SettingsView()
                            }
                            
                            Button{
                            } label: {
                                SettingRow(imageName: "bell.badge", title: "Reminders", tintColor: .blue)
                            }
                            
                            Button{
                            } label: {
                                SettingRow(imageName: "chart.bar", title: "Charts", tintColor: .blue)
                            }
                            
                            Button{
                            } label: {
                                SettingRow(imageName: "platter.filled.top.iphone", title: "Widgets", tintColor: .blue)
                            }
                            
                            //Contact Info
                            Divider()
                            
                            Button{
                                
                                print("Make a Link to twitter")
                            } label: {
                                SettingRow(imageName: "x.square", title: "Follow on Twitter / X", tintColor: .blue)
                            }
                            
                            Button{
                                
                                print("Make a Link to Mail")
                            } label: {
                                SettingRow(imageName: "captions.bubble", title: "Send Feedback", tintColor: .blue)
                            }
                            
                            
                            //App Info
                            Divider()
                            
                            Button{
                                
                                print("Make a Link to AppStore")
                            } label: {
                                SettingRow(imageName: "star.square", title: "Rate The App", tintColor: .blue)
                            }
                            
                            Button{
                                print("Write a Privacy Page")
                            } label: {
                                SettingRow(imageName: "lock.circle.dotted", title: "Privacy Policy", tintColor: .blue)
                            }
                            
                            Button{
                                
                                print("Make a page about the app")
                            } label: {
                                SettingRow(imageName: "hand.raised.square.on.square", title: "Terms of use", tintColor: .blue)
                            }
                            
                            
                            Button{
                                
                                print("Make a page about the app")
                            } label: {
                                SettingRow(imageName: "i.circle", title: "About", tintColor: .blue)
                            }
                            
                            Divider()
                            
                            
                            Button {
                                // Sign out action
                                //viewModel.signOut()
                                print("User is Signed Out")
                            } label: {
                                SettingRow(imageName: "arrow.left.circle", title: "Sign Out", tintColor:Color(iconBackgroundColor))
                            }
                            
                            
                            Button{
                                //Delete
                                print("User has Delete his Account")
                            } label: {
                                SettingRow(imageName: "trash.circle", title: "Delete Account", tintColor: Color(iconBackgroundColor))
                            }
                            
                            HStack{
                                SettingRow(imageName: "gearshape", title: "Version", tintColor: Color(iconBackgroundColor))
                                
                                
                                Spacer()
                                
                                Text(appVersion)
                                    .font(.subheadline)
                                    .foregroundColor(Color(iconBackgroundColor))
                                    .font(.custom("Charter", size: 16))
                                
                            }
                            
                            
                            VStack(spacing: 6){
                                Text("Agilo 1.0.0 (15/03)")
                                    .font(.custom("Arial", size: 11))
                                    
                                Text("Made with ☕️ and ❤️ by Pavly A.Hanna")
                                    .font(.custom("Arial", size: 11))
                                    .font(.body)
                            }
                            .frame(width:350, height: 50)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                
                
                Button(action: {
                    withAnimation(.easeOut){
                        moreViewisShowing.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.black))
                        .frame(width: 35, height: 35)
                        .background(.cyan)
                        .cornerRadius(15)
                        .padding()
                        .shadow(radius: 10)
                        .offset(x: -10, y : 30)
                })
                
                //}
            }
            .background(profileBackgroundColor)
            .navigationBarBackButtonHidden()
        }
        
        
    }
    
}

#Preview {
    MoreView(moreViewisShowing: .constant(true))
}
