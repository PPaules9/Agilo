//
//  FirstCardStack.swift
//  Agilo
//
//  Created by Pavly Paules on 26/06/2024.
//

import SwiftUI

struct FirstCardStack: View {
    var imageName: String
    var title: String
    var subtitle: String
    var duration = Date.now
    
    var body: some View {
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
                    Text("Deadline: \(formattedDate(duration))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Divider()
                    .foregroundColor(.gray)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(height: 200)
            
            Spacer()
            if let image = UIImage(named: imageName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 6, x: 0, y: 2)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    FirstCardStack(imageName: "back", title: "Name of The Project", subtitle: "Current Project is")
}
