//
//  View+ext.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    
    /**
     Presents a pop up using the given item as a data source
     for the pop up's content.
     
     Use this method when you need to present a pop up with content
     from a custom data source. The example below shows a custom data source
     `CustomAlertModel` that the `content` closure uses to populate the display
     the custom alert view shows to the user:
     
     ```swift
     struct CustomAlertModel: Identifiable {
         var id: UUID = UUID()
         let title: String
         let message: String
     }

     struct ContentView: View {
         @State var customAlert: CustomAlertModel?
         var body: some View {
             
             Button("Show custom alert") {
                 customAlert = CustomAlertModel(
                     title: "Pop Up",
                     message: "Some message here..."
                 )
             }
             .popUp(item: $customAlert) { viewModel in
                 CustomAlert(viewModel: viewModel)
             }
             .sheet(item: $customAlert) { _ in
                 EmptyView()
             }
         }
     }

     struct CustomAlert: View {
         let viewModel: CustomAlertModel
         var body: some View {
             VStack {
                 Text(viewModel.title)
                     .font(.title)
                 Text(viewModel.message)
             }
             .padding(40)
             .background(
                 RoundedRectangle(cornerRadius: 30)
                     .foregroundStyle(.white)
             )
         }
     }
     ```
     > This is not a modal view (like a sheet for example).
     It can not cover views above it.
     
     > It is possible to open many pop ups one above other. There is no limitations
     like for the sheet.
     
     - Parameters:
        - item: A binding to an optional source of truth for the pop up.
        When `item` is non-`nil`, the system passes the item's content to
        he modifier's closure. You display this content in a pop up that you
        create that the system displays to the user. If `item` changes,
        the system dismisses the pop up and replaces it with a new one
        using the same process.
        - onDismiss: The closure to execute when dismissing the pop up.
        - content: A closure returning the content of the pop up.
     */
    func popUp<Item, Content>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View where Item : Identifiable, Content : View {
        
        modifier(
            PopUp(
                item: item,
                makeItemView: content,
                onDismiss: onDismiss
            )
        )
    }
    
    /**
     Presents a pop up when a binding to a Boolean value that you
     provide is true.
     
     Use this method when you want to present a pop up to the
     user when a Boolean value you provide is true. The example
     below displays a popup of the custom alert when the user
     toggles the `isPopup` variable by
     clicking or tapping on the "Show custom alert" button:
     
     ```swift
     struct ContentView: View {
         @State var isPopup: Bool = false
         var body: some View {
             
             Button("Show custom alert") {
                 isPopup = true
             }
             .popUp(isPresented: $isPopup) {
                 VStack {
                     Text("Pop Up")
                         .font(.title)
                     Text("Some message here...")
                 }
                 .padding(40)
                 .background(
                     RoundedRectangle(cornerRadius: 30)
                         .foregroundStyle(.white)
                 )
             }
         }
     }
     ```
     > This is not a modal view (like a sheet for example).
     It can not cover views above it.
     
     > It is possible to open many pop ups one above other. There is no limitations
     like for the sheet.
     
     - Parameters:
        - isPresented: A binding to a Boolean value that determines whether
        to present the pop up that you create in the modifier's `content` closure.
        - onDismiss: The closure to execute when dismissing the pop up.
        - content: A closure that returns the content of the pop up.
     */
    func popUp<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        
        modifier(
            PopUpBasic(
                isPresented: isPresented,
                makeItemView: content,
                onDismiss: onDismiss
            )
        )
    }
}
