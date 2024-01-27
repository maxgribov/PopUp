//
//  PopUpPresentAnimation.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {

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
