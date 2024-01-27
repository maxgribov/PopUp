//
//  PopUpSettings.swift
//  
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public struct PopUpSettings {
    
    let isDismissOnBackgroundTapEnabled: Bool
    
    public init(
        isDismissOnBackgroundTapEnabled: Bool
    ) {
        self.isDismissOnBackgroundTapEnabled = isDismissOnBackgroundTapEnabled
    }
}

public extension PopUpSettings {
    
    static let `default` = PopUpSettings(
        isDismissOnBackgroundTapEnabled: true
    )
}

public extension Animation {
    
    static let defaultPopUpPresent: Animation = .interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25)
    static let defaultPopUpDismiss: Animation = .easeOut(duration: 0.3)
}
