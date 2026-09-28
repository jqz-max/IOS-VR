//
//  ContentView.swift
//  DDM
//
//  Created by alumno on 28/9/26.
//

import SwiftUI
import RealityKit

struct VistaAR: View {
    var body: some View {
        RealityView { escena3D in
            escena3D.camera = .spatialTracking
            
            let cajita = ModelEntity(mesh: .generateBox(size: 0.10))
            
            var material = SimpleMaterial(color: .red, isMetallic: true)
            cajita.model?.materials = [material]
            cajita.components.set(InputTargetComponent())
            cajita.components.set(CollisionComponent(shapes: [.generateBox(size: SIMD3<Float>(0.2, 0.2, 0.2))]))
            
            let imagen_AR = AnchorEntity(.image(group: "imagenes_AR", name: "referencia"))
            
            cajita.name = "HOLA mundo. Como estan"
            
            cajita.setParent(imagen_AR)
            
            escena3D.add(imagen_AR)
            
        }
        /*
        .gesture {
            TapGesture()
                .targetedToAnyEntity()
                .onEnded { puchoPicada in
                    print("Haz pucho picado en:  \(puchoPicada.entity.name)")
                    
                }

        }
         */
        
    }
}
