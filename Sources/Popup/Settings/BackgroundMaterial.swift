//
//  BackgroundMaterial.swift
//  
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    func pupUpBackgroundMaterial(_ value: Material) -> some View {
        environment(\.popUpBackgroundMaterial, value)
    }
}

//MARK: - Internal

struct PopUpBackgroundMaterialKey: EnvironmentKey {
    static var defaultValue: Material = .regularMaterial
}

extension EnvironmentValues {
    var popUpBackgroundMaterial: Material {
        get { self[PopUpBackgroundMaterialKey.self] }
        set { self[PopUpBackgroundMaterialKey.self] = newValue }
    }
}

