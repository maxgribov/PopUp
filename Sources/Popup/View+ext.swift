//
//  View+ext.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    func popup<Item, Content>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        settings: PopUpSettings = .default,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View where Item : Identifiable, Content : View {
        
        modifier(
            PopUp(
                item: item,
                makeItemView: content,
                onDismiss: onDismiss,
                settings: settings
            )
        )
    }
}
