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
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("projectName")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .shadow(radius: 20)
                    .fontDesign(.monospaced)

                
                Text("Deadline: 12 Aug 2024".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    .shadow(radius: 20)
                    .fontDesign(.monospaced)


                Text("Currently you are working on Build the App interface")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                    .shadow(radius: 20)
                    .fontDesign(.monospaced)


            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 70)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        
        .foregroundColor(Color("c"))
        .background(
            Color(hue: 1.0, saturation: 0.047, brightness: 0.944)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .padding(.horizontal, 20)
        .frame(height: 270)
    }
}


struct ProjectCardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProjectCardView(namespace: namespace, show: .constant(true))
    }
}
