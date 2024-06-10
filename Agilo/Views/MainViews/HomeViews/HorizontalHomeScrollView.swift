//
//  HorizontalHomeScrollView.swift
//  Agilo
//
//  Created by Pavly Paules on 19/04/2024.
//

import SwiftUI

struct HorizontalHomeScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                CurrentProject()
                HomeCard()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .padding(.leading)
            
            Divider()
        }
    }
}

#Preview {
    HorizontalHomeScrollView()
}
