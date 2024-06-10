//
//  DailyChekInView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/06/2024.
//

import SwiftUI

struct DailyChekInView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Text(" ✓ DAILY CHECKIN")
                    .font(.custom("Arial", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .fontDesign(.monospaced)
                Spacer()
            }
        }
        .padding(.top)
        .frame(width: 325, height: 30)
        
        
        HStack {
            VStack{
                Spacer()
                Divider()
                    .rotationEffect(.degrees(90))
                    .frame(width: 240)
                    .offset(y: 130)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.teal.opacity(2)))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Daily Tasks")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                Text("Task 1")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 2")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 3")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                Text("Task 4")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                
            }
            .frame(width: 320, height: 300)
            .background(Color(.orange.opacity(0.7)))
            .cornerRadius(20)
            
        }
        .padding(.top)
        .padding(.horizontal)
        .frame(width: 380)
        
        
        HStack {
            VStack{
                Spacer()
                Divider()
                    .rotationEffect(.degrees(90))
                    .frame(width: 130)
                    .offset(y: 90)
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray6))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Take Notes for the Daily Scrum Meeting")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                
                Text("13 Days till the end of current Sprint")
                    .font(.custom("Charter", size: 12))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                    .padding()
                    .frame(height: 30)
            }
            .frame(width: 320, height: 130)
            .background(Color(.purple1))
            .cornerRadius(20)
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: 380, height: 160)
        
        HStack {
            VStack{
                Spacer()
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray6))
                Spacer()
            }
            .frame(width: 25, height: 200)
            
            VStack{
                Text("Do A Spike !")
                    .font(.custom("Charter", size: 16))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                
                
                Text("Take notes for your spike")
                    .font(.custom("Charter", size: 22))
                    .foregroundStyle(.white)
                    .bold()
                    .fontDesign(.monospaced)
                
            }
            .frame(width: 320, height: 130)
            .background(Color(.indigo.opacity(0.7)))
            .cornerRadius(20)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom)
        .frame(width: 380, height: 140)
        
        HStack{
            ZStack{
                Capsule()
                    .frame(width: 60, height: 25)
                    .foregroundStyle(Color(.systemGray6))
                HStack{
                    Image(systemName: "arrowtriangle.right")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    
                    
                    Text("9")
                        .font(.custom("Arial", size: 14))
                        .fontDesign(.monospaced)
                    
                    
                }
            }
            HStack{
                Text(" ☼")
                    .font(.custom("Arial", size: 15))

                Text("Daily Streak")
                    .font(.custom("Arial", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .fontDesign(.monospaced)
            }
            
        }
        .padding(.bottom, 9)
        
    }
}

#Preview {
    DailyChekInView()
}
