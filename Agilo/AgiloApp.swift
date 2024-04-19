//
//  AgiloApp.swift
//  Agilo
//
//  Created by Pavly Paules on 03/04/2024.
//

import SwiftUI

@main
struct AgiloApp: App {
    
    @State private var projects: Int = 0
    
    var body: some Scene {
        WindowGroup {
            MainView(projects: $projects)
        }
    }
}
