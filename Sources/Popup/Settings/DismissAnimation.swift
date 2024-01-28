//
//  DismissAnimation.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    /**
     Replaces the animation for the pop up dismiss.
     
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
             .popUpDismissAnimation(.easeOut(duration: 0.2))
         }
     }
     ```
     - Parameters:
        - value: The animation to be applied to the pop up on dismiss it.
     */
    func popUpDismissAnimation(_ value: Animation) -> some View {
        environment(\.popUpDismissAnimation, value)
    }
}

//MARK: - Internal

struct PopUpDismissAnimationKey: EnvironmentKey {
    static var defaultValue: Animation = .defaultPopUpDismiss
}

extension EnvironmentValues {
    var popUpDismissAnimation: Animation {
        get { self[PopUpDismissAnimationKey.self] }
        set { self[PopUpDismissAnimationKey.self] = newValue }
    }
}
