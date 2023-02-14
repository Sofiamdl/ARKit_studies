//
//  ARManager.swift
//  ARapp
//
//  Created by sml on 13/02/23.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
    
}
