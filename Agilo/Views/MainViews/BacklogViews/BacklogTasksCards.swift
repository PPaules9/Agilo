//
//  BacklogTasksCards.swift
//  Agilo
//
//  Created by Pavly Paules on 30/06/2024.
//

import SwiftUI

struct BacklogTasksCards: View {
    @Namespace var namespace
    @State var show = false
    var title = ""
    var subtitle = ""
    var duration = Date.now
    
    var body: some View {
        ZStack{
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    HStack {
                        Image(systemName: "calendar.badge.clock")
                        Text(formattedDate(duration))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(height: 80)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }
}
#Preview {
    BacklogTasksCards()
}
