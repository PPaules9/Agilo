//
//  ActivityRings.swift
//  Agilo
//
//  Created by Pavly Paules on 27/04/2024.
//

import SwiftUI

struct ActivityRings: View {
    
    let lineWidth : CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //track
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                
                //animated Ring
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
            }
            
            .padding(lineWidth / 2)
        }
    }
}

//#Preview {
//    ActivityRings()
//}
