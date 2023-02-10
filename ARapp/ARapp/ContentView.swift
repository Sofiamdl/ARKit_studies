//
//  ContentView.swift
//  ARapp
//
//  Created by sml on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomARViewRepresentable().ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
