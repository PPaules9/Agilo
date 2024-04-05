//
//  ProfileView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isShowing: Bool
    @State private var appVersion = "1.0.0"
    
    
    var body: some View {
        ZStack{
            if isShowing {
                
                
                //for Testing Puroses only
                let testUser = User(id: NSUUID().uuidString, fullName: "Pavly Paules", email:"test@gmail.com")

                //UnComment this
                //if let user = viewModel.currentUser {
                    
                    
                    Rectangle()
                        .opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isShowing.toggle()
                        }
                
                
                    HStack {
                        ScrollView{
                            VStack(alignment: .leading, spacing: 29){
                                    HStack{
                                        Text(testUser.initials)
                                            .font(.custom("Charter", size: 25))
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .frame(width: 72, height: 72)
                                            .background(Color(.systemGray3))
                                            .clipShape(Circle())
                                        
                                        VStack (alignment: .leading, spacing: 4 ){
                                            
                                            Text(testUser.fullName)
                                                .font(.custom("Charter", size: 16))
                                                .fontWeight(.semibold)
                                                .padding(.top, 4)
                                            
                                            Text(testUser.email)
                                                .font(.custom("Charter", size: 14))
                                                .font(.footnote)
                                                .foregroundStyle(.gray)
                                            
                                        }
                                    }
                                
                                //If User Unsubscribed
                                    Button{
                                        //Subscribe Button
                                    } label: {
                                        HStack{
                                            VStack(alignment: .leading, spacing: 10){
                                                Text("Unlock All Features")
                                                    .font(.custom("Charter", size: 14))
                                                    .foregroundStyle(.white)
                                                
                                                Text("Pro Agilo Manger")
                                                    .font(.custom("Charter", size: 20))
                                                    .foregroundStyle(.white)
                                                    .bold()
                                            }
                                            .padding(.leading)
                                            
                                            Spacer()
                                        }
                                }
                                .frame(width: 250, height: 75)
                                .background(.cyan)
                                .cornerRadius(15)
                                
                                
                                Button{
                                } label: {
                                    SettingRow(imageName: "gear", title: "Settings", tintColor: .blue)
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

                                Button{
                                } label: {
                                    SettingRow(imageName: "gear", title: "Settings", tintColor: .blue)
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
                                
                                
                                Button{
                                    //sign out
                                    //viewModel.signOut()
                                    print("User is Signed Out")
                                } label: {
                                    SettingRow(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
                                }
                                
                                
                                Button{
                                    //Delete
                                    print("User has Delete his Account")
                                } label: {
                                    SettingRow(imageName: "trash.circle", title: "Delete Account", tintColor: Color(.systemGray))
                                }
                                
                                HStack{
                                    SettingRow(imageName: "gearshape", title: "Version", tintColor: Color(.systemGray))
                                    
                                    
                                    Spacer()
                                    
                                    Text(appVersion)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .font(.custom("Charter", size: 16))
                                    
                                }
                                Spacer()
                                
                                VStack(spacing: 5){
                                    Text("Agilo Manger")
                                        .font(.custom("Charter", size: 15))
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                    Text("Made with ☕️ and ❤️ by Pavly A.Hanna")
                                        .font(.custom("Charter", size: 13))
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 5.0)
                                        
                                }
                                
                            }
                            
                        }
                        .padding()
                        .frame(width: 285, alignment: .leading)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.675, green: 0.76, blue: 0.74)/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                           
                    }
                }
            }
        //}
        .navigationBarBackButtonHidden()
        .transition((.move(edge: .leading)))
        .animation(.smooth, value: isShowing)
    }
    
}

#Preview {
    ProfileView(isShowing: .constant(true))
}
