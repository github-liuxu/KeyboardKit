//
//  Autocomplete+DisabledAutocompleteService.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-03-17.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension AutocompleteService where Self == Autocomplete.DisabledAutocompleteService {

    /// Create a disabled service instance.
    static var disabled: Self {
        Autocomplete.DisabledAutocompleteService()
    }

    /// Create a disabled service instance.
    ///
    /// - Parameters:
    ///   - suggestions: The suggestions to present.
    static func disabled(
        suggestions: [Autocomplete.Suggestion] = []
    ) -> Self {
        Autocomplete.DisabledAutocompleteService(suggestions: suggestions)
    }
}

public extension Autocomplete {

    /// This service is used as a default service, until you
    /// setup KeyboardKit Pro or register a custom service.
    ///
    /// This service can also be resolved with the shorthand
    /// ``AutocompleteService/disabled(suggestions:)``.
    class DisabledAutocompleteService: AutocompleteService {

        /// Create a disabled autocomplete service.
        ///
        /// - Parameters:
        ///   - suggestions: The suggestions to present.
        public init(
            suggestions: [Autocomplete.Suggestion] = []
        ) {
            self.suggestions = suggestions
        }

        open var locale: Locale = .current
        open internal(set) var suggestions: [Autocomplete.Suggestion]

        open func autocomplete(
            _ text: String
        ) async throws -> Autocomplete.ServiceResult {
            .init(inputText: text, suggestions: suggestions)
        }

        open var canIgnoreWords: Bool { false }
        open var canLearnWords: Bool { false }
        open var ignoredWords: [String] = []
        open var learnedWords: [String] = []

        open func hasIgnoredWord(_ word: String) -> Bool { false }
        open func hasLearnedWord(_ word: String) -> Bool { false }
        open func ignoreWord(_ word: String) {}
        open func learnWord(_ word: String) {}
        open func removeIgnoredWord(_ word: String) {}
        open func unlearnWord(_ word: String) {}
    }
}
