//
//  KeyboardPreviews+Proxy.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-25.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public extension UITextDocumentProxy where Self == KeyboardPreviews.TextDocumentProxy {

    static var preview: UITextDocumentProxy {
        KeyboardPreviews.TextDocumentProxy()
    }
}

public extension KeyboardPreviews {
    
    class TextDocumentProxy: NSObject, UITextDocumentProxy {

        public override init() {
            super.init()
        }
        
        public var autocapitalizationType: UITextAutocapitalizationType = .none
        public var documentContextBeforeInput: String?
        public var documentContextAfterInput: String?
        public var hasText: Bool = false
        public var selectedText: String?
        public var documentInputMode: UITextInputMode?
        public var documentIdentifier: UUID = UUID()
        public var returnKeyType: UIReturnKeyType = .default
        
        public func adjustTextPosition(byCharacterOffset offset: Int) {}
        public func deleteBackward() {}
        public func insertText(_ text: String) {}
        public func setMarkedText(_ markedText: String, selectedRange: NSRange) {}
        public func unmarkText() {}
    }
}
#endif
