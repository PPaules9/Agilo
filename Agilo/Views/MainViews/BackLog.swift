//
//  SpikeView.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct backLog: View {
    
    
    var body: some View {
        
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
        }
    }
}

#Preview {
    backLog()
}
