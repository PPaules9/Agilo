//
//  EventRow.swift
//  Agilo
//
//  Created by Pavly Paules on 25/05/2024.
//

import SwiftUI

struct EventRow: View {
    @ScaledMetric var imageWidth: CGFloat = 40

    let event: Event
    
    var body: some View {
        HStack {
            Label {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.name)
                            .fontWeight(.bold)
                        
                        Text(event.deadLine.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
=======
                VStack(alignment: .leading, spacing: 5) {
                    Text(event.title)
                        .fontWeight(.bold)

                    Text(event.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: event.symbol)
                    .foregroundStyle(Color(event.color))
                    .padding(.trailing, 15)
            }
            .labelStyle(CustomLabelStyle())
            
            if event.isDone {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 380, height: 45)
        .cornerRadius(5)
        .shadow(radius: 5)
        .badge(event.remainingTaskCount)
    }
}

#Preview {
    EventRow(event: Event())
}
