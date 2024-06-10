//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct backLog: View {
    
    @ObservedObject var eventData: BackLogData
    @State private var newEvent = BackLog()
    @State private var selection: BackLog?
    
    
    var body: some View {
        
        NavigationSplitView {
            VStack(alignment: .leading){
                HStack {
                    Text("Backlog")
                        .font(.system(size: 32, design: .monospaced))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                List(selection: $selection){
                    
                }
                    VStack(alignment: .leading) {
                        
                            ForEach(Period.allCases) { period in
                                //Make a Section for every Period
                                if !eventData.sortedEvents(period: period).isEmpty {
                                Section(content: {
                                    VStack(alignment: .leading){
                                        ForEach(eventData.sortedEvents(period: period)) { $event in
                                            EventRow(event: event)
                                                .tag(event)
                                                .background(selection == event ? Color.gray.opacity(0.3) : Color.clear)
                                                .cornerRadius(10.0)
                                                .swipeActions {
                                                    Button(role: .destructive) {
                                                        selection = nil
                                                        eventData.remove(event)
                                                    } label: {
                                                        Label("Delete", systemImage: "trash")
                                                    }
                                                }
                                                .onTapGesture {
                                                    selection = event
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
                        .padding(.horizontal)
                    }
            }
            .padding(.top, 10)
        } detail: {
            ZStack {
                if let event = selection, let eventBinding = eventData.getBindingToEvent(event) {
                    Add(
                        projectContainer: ProjectData()
                        )
                } else {
                    Text("Select an Event")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
#Preview {
    backLog(eventData: BackLogData())
}
