//
//  Popup.swift
//
//
//  Created by Max Gribov on 26.01.2024.
//

import Foundation
import SwiftUI

struct PopUp<Item, ItemView>: ViewModifier where Item : Identifiable, ItemView : View {
    
    @Binding var item: Item?
    @ViewBuilder let makeItemView: (Item) -> ItemView
    let onDismiss: (() -> Void)?
    let settings: PopUpSettings
    
    func body(content: Content) -> some View {
        
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
