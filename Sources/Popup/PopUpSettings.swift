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
        backgroundMaterial: Material = .regularMaterial,
        contentPadding: CGFloat = 40,
        contentBackgroundCornerRadius: CGFloat = 30,
        contentBackgroundColor: Color = .white,
        showUpAnimation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25),
        dismissAnimation: Animation = .easeOut(duration: 0.3),
        isDismissOnBackgroundTapEnabled: Bool = true
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
