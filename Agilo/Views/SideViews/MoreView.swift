//
//  ProfileView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI


struct MoreView: View {
    @State private var appVersion = "1.0.0"
    @State private var showProfileView = false
    @State private var showSettings = false
    
    @Environment(\.colorScheme) var colorScheme
    
    let lightGradient = LinearGradient(gradient: Gradient(colors: [Color("Purple2"), Color("ib")]),
                                       startPoint: UnitPoint(x: 2, y: 0.9),
                                       endPoint: UnitPoint(x: 2, y: 1.2))
    
    let darkGradient = LinearGradient(gradient: Gradient(colors: [Color("c"), Color("Purple2")]), startPoint: UnitPoint(x: 2, y: 0.9), endPoint: UnitPoint(x: 2, y: 2))
    
    var BackgroundColor: Color {
        colorScheme == .light ?  Color(hue: 1.0, saturation: 0.338, brightness: 0.197) : Color(.white)
    }
    var profileBackgroundColor: LinearGradient {
        colorScheme == .light ? lightGradient : darkGradient
    }
    
    var iconBackgroundColor: Color {
        colorScheme == .light ? Color("c") : .gray
    }
    
    
    
    
    
    var body: some View {
            
        NavigationStack{
            ZStack(alignment: .topTrailing){
                
                //for Testing Puroses only
                let testUser = User(id: NSUUID().uuidString, fullName: "Pavly Paules", email:"test@gmail.com")
                
                //UnComment this
                //if let user = viewModel.currentUser {
                
                HStack {
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 15){
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
                                        .fontDesign(.monospaced)

                                })
                                
                                VStack (alignment: .leading, spacing: 4 ){
                                    
                                    Text(testUser.fullName)
                                        .font(.custom("Charter", size: 22))
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                        .fontDesign(.rounded)

                                    
                                    Text(testUser.email)
                                        .font(.custom("Charter", size: 16))
                                        .font(.footnote)
                                        .foregroundStyle(.tint)
                                        .fontDesign(.monospaced)

                                    
                                }
                                
                            }
                            .padding(.top)
                            .padding(.top)

                            //If User Unsubscribed
                            Button{
                                //Subscribe Button
                            } label: {
                                HStack{
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Unlock All Features")
                                            .font(.custom("Charter", size: 16))
                                            .foregroundStyle(Color("c"))
                                            .fontDesign(.monospaced)

                                        Text("Pro Agilo Manger")
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
                            .background(.cyan.opacity(0.6))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .offset(x: 8)
                            
                            
                            //MARK: - App General
                            HStack {
                                Text("General")
                                    .font(.system(size: 14, design: .monospaced))
                                    .foregroundStyle(Color(.systemGray2))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .offset(y: 3)
                            
                            ZStack{
                                Rectangle()
                                    .fill(.thinMaterial)
                                    .cornerRadius(20)
                                    .frame(width: 360, height: 190)
                                    .offset(y: -4)

                                    VStack(alignment: .leading, spacing: 25){
                                        NavigationLink(destination: SettingsView(),
                                                       label: { SettingRow(lastItem: false, imageName: "gear", title: "Settings", tintColor: .blue)
                                        })
                                            Button{
                                            } label: {
                                                SettingRow(lastItem: false, imageName: "bell.badge", title: "Reminders", tintColor: .blue)
                                            }
                                            
                                            Button{
                                            } label: {
                                                SettingRow(lastItem: false, imageName: "chart.bar", title: "Charts", tintColor: .blue)
                                            }
                                            
                                            Button{
                                            } label: {
                                                SettingRow(lastItem: true, imageName: "platter.filled.top.iphone", title: "Widgets", tintColor: .blue)
                                            }
                                        
                                    }
                            }
                            .frame(width:360, height: 190)
                            
                            
                            //MARK: - Contact Info
                            HStack {
                                Text("Contact")
                                    .font(.system(size: 14, design: .monospaced))
                                    .foregroundStyle(Color(.systemGray2))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .offset(y: 4)
                            
                            ZStack{
                                Rectangle()
                                    .fill(.thinMaterial)
                                    .cornerRadius(20)
                                    .frame(width: 360, height: 150)
                                    .offset(y: -4)
                                
                                VStack(alignment: .leading, spacing: 25){
                                    Button{
                                        
                                        print("Make a Link to twitter")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "x.square", title: "Follow on Twitter / X", tintColor: .blue)
                                    }
                                    
                                    Button{
                                        
                                        print("Make a Link to Mail")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "captions.bubble", title: "Send Feedback", tintColor: .blue)
                                    }
                                    Button{
                                        
                                        print("Make a Link to Mail")
                                    } label: {
                                        SettingRow(lastItem: true, imageName: "message", title: "Message Center", tintColor: .blue)
                                    }
                                }
                            }
                            .frame(width:360, height: 150)

                            
                            //MARK: - APP
                            HStack {
                                Text("APP")
                                    .font(.system(size: 14, design: .monospaced))
                                    .foregroundStyle(Color(.systemGray2))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .offset(y: 4)
                            
                            ZStack{
                                Rectangle()
                                    .fill(.thinMaterial)
                                    .cornerRadius(20)
                                    .frame(width: 360, height: 190)
                                    .offset(y: -4)
                                
                                VStack(alignment: .leading, spacing: 25){
                                    Button{
                                        
                                        print("Make a Link to AppStore")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "star.square", title: "Rate The App", tintColor: .blue)
                                    }
                                    
                                    Button{
                                        print("Write a Privacy Page")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "lock.circle.dotted", title: "Privacy Policy", tintColor: .blue)
                                    }
                                    
                                    Button{
                                        
                                        print("Make a page about the app")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "hand.raised.square.on.square", title: "Terms of use", tintColor: .blue)
                                    }
                                    
                                    
                                    Button{
                                        
                                        print("Make a page about the app")
                                    } label: {
                                        SettingRow(lastItem: true, imageName: "i.circle", title: "About", tintColor: .blue)
                                    }
                                }
                            }
                            .frame(width:360, height: 190)

                            
                            //MARK: - APP
                            HStack {
                                Text("Ciao 👋")
                                    .font(.system(size: 13, design: .monospaced))
                                    .foregroundStyle(Color(.systemGray2))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .offset(y: 4)
                            
                            
                            ZStack{
                                Rectangle()
                                    .fill(.thinMaterial)
                                    .cornerRadius(20)
                                    .frame(width: 360, height: 145)
                                    .offset(y: -5)

                                
                                VStack(alignment: .leading, spacing: 24){
                                    Button {
                                        // Sign out action
                                        //viewModel.signOut()
                                        print("User is Signed Out")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "arrow.left.circle", title: "Sign Out", tintColor:Color(iconBackgroundColor))
                                    }
                                    
                                    
                                    Button{
                                        //Delete
                                        print("User has Delete his Account")
                                    } label: {
                                        SettingRow(lastItem: false, imageName: "trash.circle", title: "Delete Account", tintColor: Color(iconBackgroundColor))
                                    }
                                    
                                    HStack{
                                        VStack {
                                            HStack{
                                                Image(systemName: "gearshape")
                                                    .imageScale(.small)
                                                    .font(.title)
                                                    .foregroundColor(Color(iconBackgroundColor))
                                                    .frame(width: 40)
                                                
                                                Text("Version")
                                                    .font(.custom("Charter", size: 18))
                                                    .font(.subheadline)
                                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                                    .fontDesign(.monospaced)
                                                
                                                Spacer()
                                                
                                                Text(appVersion)
                                                    .font(.subheadline)
                                                    .foregroundColor(Color(iconBackgroundColor))
                                                    .font(.custom("Charter", size: 16))
                                                
                                            }
                                            .padding(.horizontal)
                                            
                                           
                                        }
                                    }
                                    .offset(y: -2)
                                }
                            }
                            .frame(width:360, height: 150)

                            VStack(spacing: 6){
                                Text("Agilo 1.0.0 (15/03)")
                                    .font(.custom("Arial", size: 11))
                                    .fontDesign(.monospaced)

                                Text("Made with ☕️ and ❤️ by Pavly A.Hanna")
                                    .font(.custom("Arial", size: 11))
                                    .font(.body)
                                    .fontDesign(.monospaced)

                            }
                            .frame(width:350, height: 50)
                        }
                    }
                    .padding(.top, 2)
                    .padding(.bottom, 1)
                    .padding(.horizontal)
                }
                .navigationBarBackButtonHidden()
                
                
                //}
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden()


        }
    }
    
}

#Preview {
    MoreView()
}
