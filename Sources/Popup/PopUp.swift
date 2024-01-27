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
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            content
                .zIndex(0)
            
            if let item = item {
                
                makeItemView(item)
                    .transition(.popup(dismiss: { self.item = nil }))
                    .zIndex(1)
                    .onDisappear {
                        onDismiss?()
                    }
            }
        }
    }
}

struct PopUpBasic<ItemView>: ViewModifier where ItemView : View {
    
    @Binding var isPresented: Bool
    @ViewBuilder let makeItemView: () -> ItemView
    let onDismiss: (() -> Void)?
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            content
                .zIndex(0)
            
            if isPresented {
                
                makeItemView()
                    .transition(.popup(dismiss: { self.isPresented = false }))
                    .zIndex(1)
                    .onDisappear {
                        onDismiss?()
                    }
            }
        }
    }
}
