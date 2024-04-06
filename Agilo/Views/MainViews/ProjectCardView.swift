//
//  ProjectCardView.swift
//  Agilo
//
//  Created by Pavly Paules on 06/04/2024.
//

import SwiftUI

struct ProjectCardView: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Project 1")
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Deadline: 12 Aug 2024".uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle", in: namespace)
            Text("Currently you are working on Build the App interface")
                .font(.footnote)
                .matchedGeometryEffect(id: "text", in: namespace)
        }
        .padding(20)
        .foregroundColor(.white)
        .background(
            Color.lightPurple.matchedGeometryEffect(id: "background", in: namespace)
        ).cornerRadius(13)
        .padding(20)
            }
}


struct ProjectCardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProjectCardView(namespace: namespace, show: .constant(true))
    }
}
