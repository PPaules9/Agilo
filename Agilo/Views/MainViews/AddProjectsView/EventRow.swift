//
//  EventRow.swift
//  Agilo
//
//  Created by Pavly Paules on 25/05/2024.
//

import SwiftUI

struct EventRow: View {
    @ScaledMetric var imageWidth: CGFloat = 40
    let event: BackLog
    
    var body: some View {
        
        HStack {
            Label {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.title)
                            .fontWeight(.bold)
                        
                        Text(event.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
            } icon: {
                Image(systemName: event.symbol)
                    .foregroundStyle(Color(event.color))
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
        }
        .badge(event.remainingTaskCount)
        .frame(width: 380, height: 45)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}

#Preview {
    EventRow(event: BackLog())
}
