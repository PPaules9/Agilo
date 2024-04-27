//
//  SearchView.swift
//  Agilo
//
//  Created by Pavly Paules on 12/04/2024.
//

import SwiftUI

struct SearchView: View {
    @State var capsuleText: String // Text to display in the capsule
        
    @Environment(\.colorScheme) var colorScheme
    var BackgroundColor: Color {
        colorScheme == .light ?  Color(hue: 1.0, saturation: 0.338, brightness: 0.197) : Color(.white)
    }
    var body: some View {
        NavigationStack{
            
//            Rectangle()
//                .foregroundColor(Color(.systemGray4))
//                .frame(width: 350, height: 40)
//                .cornerRadius(10)
//                .overlay(
//                    TextField("Search Projects here", text: $capsuleText)
//                      .foregroundColor(.white)
//                      .fontWeight(.bold)
//                      .padding()
//                      .font(.system(.title3, design: .monospaced))
//                  )
//                  .onTapGesture {
//                    // Handle search logic here
//
//                  }
            
            ScrollView(showsIndicators: false) {
                VStack{
                    HStack {
                        Text("Discover")
                            .font(.system(size: 32, design: .monospaced))
                            .bold()
                            .foregroundStyle(Color(BackgroundColor))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 15){
                            Button(action: {
                                //Second Tag
                            }, label: {
                                VStack{
                                    ZStack{
                                        Capsule()
                                            .frame(width: 90, height: 70)
                                            .foregroundColor(.cyan)
                                            .blur(radius: 1)
                                            .brightness(0.6)
                                        Image(systemName: "pencil.slash")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                        
                                    }
                                    .padding(.bottom, 5)
                                    
                                    Text("PRODUCTVE")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundStyle(Color(BackgroundColor))
                                }
                                .frame(width:110, height: 100)
                            })
                            
                            
                            Button(action: {
                                //first Tag
                            }, label: {
                                VStack{
                                    ZStack{
                                        Capsule()
                                            .frame(width: 90, height: 70)
                                            .foregroundColor(.purple)
                                            .blur(radius: 1)
                                            .brightness(0.6)
                                        Image(systemName: "folder.circle")
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                        
                                    }
                                    .padding(.bottom, 5)
                                    
                                    Text("Game")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundStyle(Color(BackgroundColor))
                                }
                                .frame(width:110, height: 100)
                            })
                            
                            
                            Button(action: {
                                //Second Tag
                            }, label: {
                                VStack{
                                    ZStack{
                                        Capsule()
                                            .frame(width: 90, height: 70)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.338, brightness: 1.4))
                                        
                                        Image(systemName: "iphone")
                                            .resizable()
                                            .frame(width: 30, height: 50)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                        
                                    }
                                    .padding(.bottom, 5)
                                    
                                    Text("APPLICATION")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundStyle(Color(BackgroundColor))
                                }
                                .frame(width:110, height: 100)
                            })
                            
                            
                            Button(action: {
                                //Second Tag
                            }, label: {
                                VStack{
                                    ZStack{
                                        Capsule()
                                            .frame(width: 90, height: 70)
                                            .foregroundColor(Color(.mint))
                                            .brightness(0.6)
                                            .blur(radius: 1)
                                        
                                        Image(systemName: "building")
                                            .resizable()
                                            .frame(width: 30, height: 50)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                        
                                        
                                    }
                                    .padding(.bottom, 5)
                                    
                                    Text("CONSTRUCTION")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundStyle(Color(BackgroundColor))
                                }
                                .frame(width:110, height: 100)
                            })
                            
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        Text("Suggested")
                            .font(.system(size: 21, design: .monospaced))
                            .foregroundStyle(Color(BackgroundColor))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.leading)
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            SuggestedProject()
                            
                            SuggestedProject()
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.047, brightness: 0.944))
                                Text("DSDS")
                                    .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                    .fontDesign(.monospaced)
                                
                                Button(action:  {
                                    //Add ot to your Projects
                                }, label:{
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 210, height: 50)
                                            .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 1))
                                            .cornerRadius(22)
                                            .shadow(radius: 15)
                                        HStack {
                                            Image(systemName: "plus")
                                                .foregroundStyle(Color(hue: 1.2, saturation: 0.338, brightness: 0.197))
                                            Text("Add to Projects")
                                                .bold()
                                                .fontDesign(.monospaced)
                                                .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                        }
                                        
                                        
                                    }
                                    .offset(x: 26, y: 164)
                                })
                                
                            }
                            .frame(width: 250, height: 400)
                            
                        }
                        .padding()
                    }
                }
                
                HStack {
                    Text("Trending Projects")
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundStyle(Color(.gray))
                        .lineLimit(1)
                    Spacer()
                }
                
                .padding(.top)
                .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.047, brightness: 0.944))
                            Text("DSDS")
                                .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                .fontDesign(.monospaced)
                            
                            Button(action:  {
                                //Add ot to your Projects
                            }, label:{
                                ZStack{
                                    Rectangle()
                                        .frame(width: 210, height: 50)
                                        .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 1))
                                        .cornerRadius(22)
                                        .shadow(radius: 15)
                                    HStack {
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color(hue: 1.2, saturation: 0.338, brightness: 0.197))
                                        Text("Add to Projects")
                                            .bold()
                                            .fontDesign(.monospaced)
                                            .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                    }
                                    
                                    
                                }
                                .offset(x: 26, y: 164)
                            })
                            
                        }
                        .frame(width: 280, height: 400)
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.047, brightness: 0.944))
                            Text("DSDS")
                                .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                .fontDesign(.monospaced)
                            
                            Button(action:  {
                                //Add ot to your Projects
                            }, label:{
                                ZStack{
                                    Rectangle()
                                        .frame(width: 210, height: 50)
                                        .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 1))
                                        .cornerRadius(22)
                                        .shadow(radius: 15)
                                    HStack {
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color(hue: 1.2, saturation: 0.338, brightness: 0.197))
                                        Text("Add to Projects")
                                            .bold()
                                            .fontDesign(.monospaced)
                                            .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                    }
                                    
                                    
                                }
                                .offset(x: 26, y: 164)
                            })
                            
                        }
                        .frame(width: 280, height: 400)
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.047, brightness: 0.944))
                            Text("DSDS")
                                .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                .fontDesign(.monospaced)
                            
                            Button(action:  {
                                //Add ot to your Projects
                            }, label:{
                                ZStack{
                                    Rectangle()
                                        .frame(width: 210, height: 50)
                                        .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 1))
                                        .cornerRadius(22)
                                        .shadow(radius: 15)
                                    HStack {
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color(hue: 1.2, saturation: 0.338, brightness: 0.197))
                                        Text("Add to Projects")
                                            .bold()
                                            .fontDesign(.monospaced)
                                            .foregroundStyle(Color(hue: 1.0, saturation: 0.338, brightness: 0.197))
                                    }
                                    
                                    
                                }
                                .offset(x: 26, y: 164)
                            })
                            
                        }
                        .frame(width: 250, height: 400)
                        
                    }
                    .padding()
                }
                
                HStack {
                    Text("Get Things Done in time")
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundStyle(Color(.gray))
                        .lineLimit(1)
                    Spacer()
                }
                
                .padding(.top)
                .padding(.leading)
                
                VStack {
                    Form {
                        Text("Complete View")
                        Text("Complete View")
                        Text("Complete View")
                    }
                    .fontDesign(.monospaced)
                }
                .frame(width: 350, height: 500)

            }
        }
    }
}

#Preview {
    SearchView(capsuleText: "Search Projects")
}
