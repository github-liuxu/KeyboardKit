//
//  Keyboard+LayoutType.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2025-02-08.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Keyboard {
    
    /// This enum defines various keyboard layout types.
    ///
    /// Unlike the ``InputSet`` and ``KeyboardLayout`` types,
    /// this enum defines standard layout types, without any
    /// specific information about how a type is implemented.
    /// 
    /// This is used in KeyboardKit Pro, to define a list of
    /// supported layout types for each locale.
    enum LayoutType: String, CaseIterable, Identifiable, KeyboardModel {
        
        /// The layout of an AZERTY keyboard.
        case azerty
        
        /// The layout of a Colemak keyboard.
        case colemak
        
        /// The layout of a QWERTY keyboard.
        case qwerty
        
        /// The layout of a QWERTY keyboard in Catalan.
        case qwerty_catalan
        
        /// The layout of a QWERTZ keyboard.
        case qwertz
        
        /// The layout type's unique ID.
        public var id: String { rawValue }
    }
}

public extension Keyboard.LayoutType {
    
    // The layout type's display name.
    var displayName: String {
        switch self {
        case .colemak: rawValue.capitalized
        case .qwerty_catalan: "QWERTY - Catalan"
        default: rawValue.uppercased()
        }
    }
}
