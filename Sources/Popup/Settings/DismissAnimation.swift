//
//  DismissAnimation.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
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
