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
    var percent: Double
    var startAngle: Double
    var adjustedSympol : String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let width = geometry.size.width
                let height = geometry.size.height
                let radius = min(height, width) / 2
                let center = CGPoint(x: width / 2, y: height / 2)
                let startAngleRadians = startAngle * .pi / 180
                
                let arrowX = center.x + radius * cos(CGFloat(startAngleRadians))
                let arrowY = center.y + radius * sin(CGFloat(startAngleRadians))
                //track
                
                
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                
                
                //animated Ring
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
                
                Image(systemName: adjustedSympol)
                    .position(x: arrowX, y: arrowY)
                
            }
            
            .padding(lineWidth / 2)
        }
    }
}

#Preview {
    ActivityRings(lineWidth: 40, backgroundColor: Color.pink, foregroundColor: Color.pink, percentage: 0.3, percent: 75, startAngle: -90, adjustedSympol: "arrow")
}
