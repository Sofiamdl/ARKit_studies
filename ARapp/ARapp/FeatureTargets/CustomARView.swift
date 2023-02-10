//
//  CustomARView.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import ARKit
import SwiftUI
import RealityKit

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        placeBox()
    }
    
    func configurationExamples() {
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        // Não pega no brasil, mas é para ver coordenadas geograficas.
        let _ = ARGeoTrackingConfiguration()
        
        let _ = ARFaceTrackingConfiguration()
        
        let _ = ARBodyTrackingConfiguration()
           
    }
    
    func setAnchor() {
        let coordinator = AnchorEntity(world: .zero)
        scene.addAnchor(coordinator)
    }
    
    func placeBox() {
        let box = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
}
