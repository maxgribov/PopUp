//
//  File.swift
//  
//
//  Created by Max Gribov on 27.01.2024.
//

import SwiftUI

public extension Animation {
    
    static let defaultPopUpPresent: Animation = .interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25)
    static let defaultPopUpDismiss: Animation = .easeOut(duration: 0.3)
}
