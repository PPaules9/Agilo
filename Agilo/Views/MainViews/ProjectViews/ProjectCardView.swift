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
    let event: BackLog
    
    
    var body: some View {
        VStack {
                
                    VStack(alignment: .leading, spacing: 12) {
                        Text(event.title)
                            .font(.title.weight(.bold))
                            .matchedGeometryEffect(id: "title_\(event.id)", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .shadow(radius: 20)
                            .fontDesign(.monospaced)
                        
                        Text(event.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "subtitle_\(event.id)", in: namespace)
                            .shadow(radius: 20)
                            .fontDesign(.monospaced)
                        
                        
                        Text("This task belongs to")
                            .font(.footnote)
                            .matchedGeometryEffect(id: "text_\(event.id)", in: namespace)
                            .shadow(radius: 20)
                            .fontDesign(.monospaced)
                        
                }
            .labelStyle(CustomLabelStyle())
                
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 70)
                        .matchedGeometryEffect(id: "blur_\(event.id)", in: namespace)
                )
            
            
            .foregroundColor(Color("c"))
            .background(
                Color(.pink.opacity(0.75))
                    .matchedGeometryEffect(id: "background_\(event.id)", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .matchedGeometryEffect(id: "mask_\(event.id)", in: namespace)
            )
            .padding(.horizontal, 20)
            .frame(width: 380,height: 130)
        }
    }
}


struct ProjectCardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProjectCardView(namespace: namespace, show: .constant(true), event: BackLog())
    }
}
