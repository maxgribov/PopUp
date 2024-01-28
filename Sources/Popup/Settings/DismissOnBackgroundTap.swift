//
//  DismissOnBackgroundTap.swift
//
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension View {
    /**
     Enables or disables the pop up dismissal on user tap at the dim view outside of the pop up view.
     
     ## Example:
     ```swift
     struct ContentView: View {
         @State var customAlert: CustomAlertModel?
         var body: some View {
             
             Group {
                 // ...
             }
             .popUp(item: $customAlert) { viewModel in
                 CustomAlert(viewModel: viewModel)
             }
             .popUpDismissOnBackgroundTap(false)
         }
     }
     ```
     - Parameters:
        - value: A boolean value that determines whether to dismiss or not the pop up
        on the user tap at the dim view outside of the pop up view. Default value is `true`.
     */
    func popUpDismissOnBackgroundTap(_ value: Bool) -> some View {
        environment(\.popUpDismissOnBackgroundTap, value)
    }
}

//MARK: - Internal

struct PopUpDismissOnBackgroundTapKey: EnvironmentKey {
    static var defaultValue: Bool = true
}

extension EnvironmentValues {
    var popUpDismissOnBackgroundTap: Bool {
        get { self[PopUpDismissOnBackgroundTapKey.self] }
        set { self[PopUpDismissOnBackgroundTapKey.self] = newValue }
    }
}
