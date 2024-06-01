//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct backLog: View {
    
    @ObservedObject var eventData: EventData
    @State private var newEvent = Event()
    @State private var selection: Event?

    var body: some View {
        
            NavigationSplitView {
                List(selection: $selection) {
                    ForEach(Period.allCases) { period in
                        //Make a Section for every Period
                        Section(content: {
                            ForEach(eventData.sortedEvents(period: period)) { $event in
                                EventRow(event: event)
                                    .tag(event)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            selection = nil
                                            eventData.remove(event)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        }, header: {
                            Text(period.name)
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .fontWeight(.bold)
                        })
                        .disabled(eventData.sortedEvents(period: period).isEmpty)
                    }
                }
                .padding(.top, 10)
                .navigationTitle("Project's Backlog")
                
            } detail: {
                ZStack {
                    if let event = selection, let eventBinding = eventData.getBindingToEvent(event) {
                        Add(eventData: eventData, event: eventBinding)
                    } else {
                        Text("Select an Event")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
}
#Preview {
    backLog(eventData: EventData())
}
