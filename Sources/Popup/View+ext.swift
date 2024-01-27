//
//  View+ext.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    func popUp<Item, Content>(
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
    
    func popUp<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        settings: PopUpSettings = .default,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        
        modifier(
            PopUpBasic(
                isPresented: isPresented,
                makeItemView: content,
                onDismiss: onDismiss,
                settings: settings
            )
        )
    }
}
