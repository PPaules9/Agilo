//
//  Projects.swift
//  Agilo
//
//  Created by Pavly Paules on 05/04/2024.
//

import SwiftUI

struct Projects: View {
    
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack{
            if !show {
                ProjectCardView(namespace: namespace, show: $show)
                
            } else {
                ProjectDetailView(namespace: namespace, show: $show)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    Projects()
}
