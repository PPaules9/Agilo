//
//  ShowMore.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationStack{
            VStack(spacing:5) {
                Text("Profile (Edit Name, and email")
                Text("Password")
                Text("Enter your Mobile Number")

                Text("Badges")
                Text("Affiliate program, Refer a Friend, and get 1 month Free primeum feature")
                Text("Location")
                Text("Account ID")
                Text("Member Scince 2020")

            }
        }
    }
}

#Preview {
    ProfileView()
}
