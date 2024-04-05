//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct SpikeView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Spikes Yet", systemImage: "plus")
        } description: {
            Text("There is no Projects yet")
        }
    }
}

#Preview {
    SpikeView()
}
