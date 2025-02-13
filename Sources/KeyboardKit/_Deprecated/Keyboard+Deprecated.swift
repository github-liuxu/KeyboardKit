import Foundation
import SwiftUI

public extension Keyboard.InputToolbarDisplayMode {
    
    @available(*, deprecated, renamed: "none")
    static var hidden: Self { .none }
    
    @available(*, deprecated, renamed: "characters")
    static func inputs(_ inputs: String) -> Self {
        .characters(inputs)
    }
}

public extension Keyboard.SpaceLongPressBehavior {
    
    @available(*, deprecated, message: "Use Keyboard.SpaceContextMenu instead.")
    static var moveInputCursorWithLocaleSwitcher: Self { .moveInputCursor }
    
    @available(*, deprecated, message: "Use Keyboard.SpaceContextMenu instead.")
    var shouldAddTrailingLocaleContextMenu: Bool {
        switch self {
        case .moveInputCursor: false
        case .openLocaleContextMenu: false
        }
    }
    
    /// Whether space should move the input cursor.
    var shouldMoveInputCursor: Bool {
        switch self {
        case .moveInputCursor: true
        case .openLocaleContextMenu: false
        }
    }
    
    /// Whether space should open a locale context menu.
    var shouldOpenLocaleContextMenu: Bool {
        switch self {
        case .moveInputCursor: false
        case .openLocaleContextMenu: true
        }
    }
}

public extension KeyboardContext {
    
    @available(*, deprecated, message: "Use `settings.spaceLongPressBehavior` instead.")
    var spaceLongPressBehavior: Keyboard.SpaceLongPressBehavior {
        get { settings.spaceLongPressBehavior }
        set { settings.spaceLongPressBehavior = newValue }
    }
}
