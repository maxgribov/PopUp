//
//  BackgroundMaterial.swift
//  
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    /**
     Replaces the material for the dim view that covers content
     under the pop up.
     
     ## Example:
     ```swift
     struct ContentView: View {
         @State var customAlert: CustomAlertModel?
         var body: some View {
             
             Group {
                 // ...
             }
             .popUp(item: $customAlert) { viewModel in
                 CustomAlert(viewModel: viewModel)
             }
             .popUpBackgroundMaterial(.ultraThin)
         }
     }
     ```
     - Parameters:
        - value: The material to be applied to the dim view.
     */
    func popUpBackgroundMaterial(_ value: Material) -> some View {
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

