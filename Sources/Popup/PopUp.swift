//
//  Popup.swift
//
//
//  Created by Max Gribov on 26.01.2024.
//

import Foundation
import SwiftUI

public struct PopUp<Item, ItemView>: ViewModifier where Item : Identifiable, ItemView : View {
    
    @Binding var item: Item?
    @ViewBuilder let makeItemView: (Item) -> ItemView
    let onDismiss: (() -> Void)?
    let settings: PopUpSettings
    
    public func body(content: Content) -> some View {
        
        ZStack {
            
            content
                .zIndex(0)
            
            if let item = item {
                
                makeItemView(item)
                    .transition(.popup(dismiss: { self.item = nil }, settings: settings))
                    .zIndex(1)
                    .onDisappear {
                        onDismiss?()
                    }
            }
        }
    }
}

public extension View {
    
    func popup<Item, Content>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        settings: PopUpSettings = .init(),
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


