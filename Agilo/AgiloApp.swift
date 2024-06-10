//
//  AgiloApp.swift
//  Agilo
//
//  Created by Pavly Paules on 03/04/2024.
//

import SwiftData
import SwiftUI

@main
struct AgiloApp: App {
    
    @State private var eventData = BackLogData()
    @State private var projectContainer = ProjectData()

    var body: some Scene {
        WindowGroup {
            MainView(eventData: BackLogData(), projectContainer: ProjectData())
        }
    }
}
