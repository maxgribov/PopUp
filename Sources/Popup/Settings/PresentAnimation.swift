//
//  PresentAnimation.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {

    /**
     Replaces the animation for the pop up present.
     
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
             .popUpPresentAnimation(.easeOut(duration: 0.2))
         }
     }
     ```
     - Parameters:
        - value: The animation to be applied to the pop up on present it.
     */
    func popUpPresentAnimation(_ value: Animation) -> some View {
        environment(\.popUpPresentAnimation, value)
    }
}

//MARK: - Internal

struct PopUpPresentAnimationKey: EnvironmentKey {
    static var defaultValue: Animation = .defaultPopUpPresent
}

extension EnvironmentValues {
    var popUpPresentAnimation: Animation {
        get { self[PopUpPresentAnimationKey.self] }
        set { self[PopUpPresentAnimationKey.self] = newValue }
    }
}
