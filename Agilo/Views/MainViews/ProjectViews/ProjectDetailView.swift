//
//  ProjectDetailView.swift
//  Agilo
//
//  Created by Pavly Paules on 06/04/2024.
//

import SwiftUI

struct ProjectDetailView: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    @State private var showProject = false
    let event: Event

    var body: some View {
        ScrollView {
            VStack{
            VStack {
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .foregroundColor(.black)
            .background(
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .blur(radius: 1.5)
                    .matchedGeometryEffect(id: "image", in: namespace)
            )
            .background(
                Image("backgroundPic")
                    .resizable()
                    .matchedGeometryEffect(id: "background", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask", in: namespace)
            )
            .overlay(
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Button {
                        //Open your Projects
                        showProject.toggle()

                    } label:{
                        ZStack{
                            Rectangle()
                                .fill(.thickMaterial)
                                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .frame(width:80, height: 35)
                                .shadow(radius: 15)
                            HStack {
                                Text("Open")
                                    .bold()
                                    .foregroundStyle(Color(.mainBlack))
                            }
                        }
                        .offset(x: 220)
                    }
                    .sheet(isPresented: $showProject){
                        SettingsView()
                    }
                    
                    Text(event.title)
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title_\(event.id)", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontDesign(.monospaced)
                    

                    Text(event.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle_\(event.id)", in: namespace)
                        .fontDesign(.monospaced)

                    Text("This task belongs to")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text_\(event.id)", in: namespace)
                        .fontDesign(.monospaced)

                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .cornerRadius(10)
                            .padding(8)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        Text("This Task is belong to Daniel")
                            .fontDesign(.monospaced)

                    }
                    
                }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .matchedGeometryEffect(id: "blur_\(event.id)", in: namespace)
                    )
                    .offset(y: 250)
                    .padding(20)
                
            )
        }
            .frame(maxHeight: .infinity)
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ProjectDetailView(namespace: namespace, show: .constant(true), event: Event())
    }
}
