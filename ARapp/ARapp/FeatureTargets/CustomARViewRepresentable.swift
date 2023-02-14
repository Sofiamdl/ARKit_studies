//
//  CustomARViewRepresentable.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    let customArView = CustomARView()
    func makeUIView(context: Context) -> CustomARView {
        return customArView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) { }
    
    func raycastFunc(location: CGPoint) {
        customArView.raycastFunc(location: location)
    }

    
}
