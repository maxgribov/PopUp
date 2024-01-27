//
//  PopUpSettings.swift
//  
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public struct PopUpSettings {
    
    let backgroundMaterial: Material
    let contentPadding: CGFloat
    let contentBackgroundCornerRadius: CGFloat
    let contentBackgroundColor: Color
    let showUpAnimation: Animation
    let dismissAnimation: Animation
    let isDismissOnBackgroundTapEnabled: Bool
    
    public init(
        backgroundMaterial: Material,
        contentPadding: CGFloat,
        contentBackgroundCornerRadius: CGFloat,
        contentBackgroundColor: Color,
        showUpAnimation: Animation,
        dismissAnimation: Animation,
        isDismissOnBackgroundTapEnabled: Bool
    ) {
        self.backgroundMaterial = backgroundMaterial
        self.contentPadding = contentPadding
        self.contentBackgroundCornerRadius = contentBackgroundCornerRadius
        self.contentBackgroundColor = contentBackgroundColor
        self.showUpAnimation = showUpAnimation
        self.dismissAnimation = dismissAnimation
        self.isDismissOnBackgroundTapEnabled = isDismissOnBackgroundTapEnabled
    }
}

public extension PopUpSettings {
    
    static let `default` = PopUpSettings(
        backgroundMaterial: .regular,
        contentPadding: 40,
        contentBackgroundCornerRadius: 30,
        contentBackgroundColor: .white,
        showUpAnimation: .interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25),
        dismissAnimation: .easeOut(duration: 0.3),
        isDismissOnBackgroundTapEnabled: true
    )
}
