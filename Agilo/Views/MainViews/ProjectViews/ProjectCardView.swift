//
//  ProjectCardView.swift
//  Agilo
//
//  Created by Pavly Paules on 06/04/2024.
//

import SwiftUI

struct ProjectCardView: View {

    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Hello")
                    .font(.title.weight(.bold))
//                    .matchedGeometryEffect(id: "title_", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .shadow(radius: 20)
                    .fontDesign(.monospaced)
                
                
            }
            .labelStyle(CustomLabelStyle())
        }
    }
}

struct ProjectCardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProjectCardView()
    }
}
