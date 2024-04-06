//
//  BackgroundColor.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .mediumPurple, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundColor()
}
