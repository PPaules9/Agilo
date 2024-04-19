//
//   MorivationalHomeViewPart.swift
//  Agilo
//
//  Created by Pavly Paules on 19/04/2024.
//

import SwiftUI

struct MotivationalHomeViewPart: View {
    
    @State var motiveQuote = ["First Quote",
                              "Second Quote",
                              "Third Quote",
                              "dajnk",
                              "kjnnakjns",
                              "kln",
                              "jkhb",
                              "dsjf"
                              
    ]
    var body: some View {
        VStack(spacing: 20){
            HStack {
                Text("Need Inspiration?")
                    .fontDesign(.monospaced)
                Spacer()
            }
//            Text(motiveQuote[.random(in: 0...motiveQuote.count)])
            Text("\("'")\("'")")
                .font(.caption)
                .fontDesign(.monospaced)

        }
        .frame(width:350, height: 150)
    }
}

#Preview {
    MotivationalHomeViewPart()
}
