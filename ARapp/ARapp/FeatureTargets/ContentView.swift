//
//  ContentView.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [
        .green,
        .red,
        .blue
    ]
    let arView = CustomARViewRepresentable()
    var body: some View {
        arView
            .onTapGesture(coordinateSpace: .global) { location in
                arView.raycastFunc(location: location)
            }
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                ScrollView(.horizontal) {
                    HStack{
                        Button ("APAGA")  {
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                        }.padding()
                        ForEach(colors, id: \.self) { color in
                            Button ("COLOCA")  {
                                ARManager.shared.actionStream.send(.placeBox(color: color))
                            }.background(color)
                                .padding()
                        }
                    }
                    
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
