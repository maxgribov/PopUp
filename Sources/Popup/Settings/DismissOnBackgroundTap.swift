//
//  DismissOnBackgroundTap.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    func popUpDismissOnBackgroundTap(_ value: Bool) -> some View {
        environment(\.popUpDismissOnBackgroundTap, value)
    }
}

//MARK: - Internal

struct PopUpDismissOnBackgroundTapKey: EnvironmentKey {
    static var defaultValue: Bool = true
}

extension EnvironmentValues {
    var popUpDismissOnBackgroundTap: Bool {
        get { self[PopUpDismissOnBackgroundTapKey.self] }
        set { self[PopUpDismissOnBackgroundTapKey.self] = newValue }
    }
}
