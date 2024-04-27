//
//  SettingsView.swift
//  Agilo
//
//  Created by Pavly Paules on 10/04/2024.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Appearnce Dark Mode & Light Mode")
                Text("My Subscription")
                Text("iCloudSync")
                Text("Language")
                Text("First Day of the Week?")
                Text("Get Agilo everywhere")
            }
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button(action: {
//                        withAnimation(.easeIn) {
//                            dismiss()
//                        }
//                        
//                    }
//                    
//                    
//                }
                
            
        }
    }
}

#Preview {
    SettingsView()
}
