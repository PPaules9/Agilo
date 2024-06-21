//
//  HorizontalHomeScrollView.swift
//  Agilo
//
//  Created by Pavly Paules on 19/04/2024.
//

import SwiftUI

struct HorizontalHomeScrollView: View {
    @ObservedObject var projectContainer : ProjectData

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 10){
                CurrentProject(projectContainer: projectContainer)
                HomeCard()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            
            Divider()
        }
    }
}

#Preview {
    HorizontalHomeScrollView(projectContainer: ProjectData())
}
