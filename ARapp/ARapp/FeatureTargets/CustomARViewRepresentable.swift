//
//  CustomARViewRepresentable.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) { }
}
