//
//  PopUpViewModifier.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

struct PopUpViewModifier: ViewModifier {
    
    @Environment(\.popUpBackgroundMaterial) var backgroundMaterial
    @Environment(\.popUpPresentAnimation) var presentAnimation

    var transitionProgress: Double
    var isPresenting: Bool
    let dismiss: () -> Void
    var settings: PopUpSettings
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            Color.clear
                .background(backgroundMaterial)
                .opacity(transitionProgress)
                .animation(.easeInOut, value: transitionProgress)
                .ignoresSafeArea()
                .zIndex(0)
                .onTapGesture {
                    if settings.isDismissOnBackgroundTapEnabled {
                        dismiss()
                    }
                }

            content
                .scaleEffect(x: transitionProgress, y: transitionProgress)
                .opacity(transitionProgress)
                .animation(isPresenting ? presentAnimation : settings.dismissAnimation, value: transitionProgress)
                .zIndex(1)
        }
    }
}

extension AnyTransition {
 
    static func popup(dismiss: @escaping () -> Void, settings: PopUpSettings) -> AnyTransition {
        
        .modifier(
            active: PopUpViewModifier(
                transitionProgress: 0,
                isPresenting: false,
                dismiss: dismiss,
                settings: settings
            ),
            identity: PopUpViewModifier(
                transitionProgress: 1,
                isPresenting: true,
                dismiss: dismiss,
                settings: settings
            )
        )
    }
}

