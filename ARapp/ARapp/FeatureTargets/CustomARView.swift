//
//  CustomARView.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import ARKit
import SwiftUI
import RealityKit
import Combine

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        subscribeToActionScreen()
    }
    
    private var cancellables: Set<AnyCancellable> = []
 
    func subscribeToActionScreen() {
        print("oi")
        ARManager.shared
            .actionStream
            .sink { [weak self] action in
                switch action {
                    case .placeBox(let color):
                       self?.placeBox(ofColor: color)
                    case .removeAllAnchors:
                        self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancellables)
    }
    
    func raycastFunc(location: CGPoint) {
        guard let query = self.makeRaycastQuery(from: location, allowing: .estimatedPlane, alignment: .any)
          else { return }
          
          guard let result = self.session.raycast(query).first
                  
          else { return }
          
          let sphereEntity = ModelEntity(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .white, isMetallic: false)])
          
       
          let raycastAnchor = AnchorEntity(world: result.worldTransform)
          
          raycastAnchor.addChild(sphereEntity)
          self.scene.anchors.append(raycastAnchor)
        
        installGestures(.all, for: sphereEntity)

        sphereEntity.generateCollisionShapes(recursive: true)
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
    
    func placeBox(ofColor color: Color) {
        let box = MeshResource.generateBox(size: 0.5)
        let material = SimpleMaterial(color: UIColor(color),roughness: 0, isMetallic: false)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        entity.generateCollisionShapes(recursive: true)

        anchor.addChild(entity)
        scene.addAnchor(anchor)

        installGestures(.all, for: entity)

        entity.generateCollisionShapes(recursive: true)

    }
}
