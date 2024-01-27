//
//  Sample.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

//MARK: - REMOVE

struct Item: Identifiable {
    let id = UUID()
}

struct SomeView: View {
    
    @State var item: Item?
    
    var body: some View {
        
        ZStack {
            
            Color.orange
                .ignoresSafeArea()
            
            Button(action: {
                withAnimation {
                    item = Item()
                }
                
            }, label: {
                Text("Tap me")
            })
        }
        .popup(item: $item) { _ in
            
            VStack {

                Text("Pop Up")
                    .font(.title)
                    .foregroundStyle(.black)

                Text("Some message here...")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    SomeView(item: nil)
}
