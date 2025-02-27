//
//  KeyboardApp.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2024-04-01.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/// This type can be used to define important properties for
/// your app, and is also a namespace for app-based features.
///
/// You can create a static app value and add it to both the
/// app and its keyboard, to be able to use it in both, e.g.:
///
/// ```swift
/// extension KeyboardApp {
///     static var keyboardKitDemo: Self {
///         .init(
///             name: "KeyboardKit",
///             licenseKey: "abc123",
///             bundleId: "com.keyboardkit.demo",
///             appGroupId: "group.com.keyboardkit.demo",
///             locales: [.english, .swedish, .persian],
///             autocomplete: .init(...),
///             deepLinks: .init(app: "keyboardkit://")
///         )
///     }
/// }
/// ```
///
/// > Important: The ``locales`` collection is only describe which locales you *want* to use in your app. It
/// will be capped to the number of locales your KeyboardKit
/// Pro license includes.
///
/// See <doc:App-Article> for more information.
public struct KeyboardApp {

    /// Create a custom keyboard app value.
    ///
    /// - Parameters:
    ///   - name: The name of the app.
    ///   - licenseKey: Your license key, if any.
    ///   - bundleId: The app's bundle identifier.
    ///   - keyboardBundleId: The app's keyboard bundle identifier, by default `<bundleId>.keyboard`.
    ///   - appGroupId: The app's App Group identifier, if any.
    ///   - locales: The locales to use in the app, by default `.all`.
    ///   - autocomplete: The autocomplete configuration to use.
    ///   - deepLinks: App-specific deep links, if any.
    ///   - keyboardSettingsKeyPrefix: A custom keyboard settings key prefix, if any.
    public init(
        name: String,
        licenseKey: String? = nil,
        bundleId: String,
        keyboardBundleId: String? = nil,
        appGroupId: String? = nil,
        locales: [Locale] = .keyboardKitSupported,
        autocomplete: AutocompleteConfiguration = .init(),
        deepLinks: DeepLinks? = nil,
        keyboardSettingsKeyPrefix: String? = nil
    ) {
        self.name = name
        self.bundleId = bundleId
        self.appGroupId = appGroupId
        self.keyboardBundleId = keyboardBundleId ?? "\(bundleId).keyboard"
        self.locales = locales
        self.licenseKey = licenseKey
        self.autocomplete = autocomplete
        self.deepLinks = deepLinks
        self.keyboardSettingsKeyPrefix = keyboardSettingsKeyPrefix
    }

    @available(*, deprecated, message: "Migration Deprecation, will be removed in 9.1! autocompleteConfiguration has been renamed to just autocomplete.")
    @_disfavoredOverload
    public init(
        name: String,
        licenseKey: String? = nil,
        bundleId: String,
        keyboardBundleId: String? = nil,
        appGroupId: String? = nil,
        locales: [Locale] = .keyboardKitSupported,
        autocompleteConfiguration: AutocompleteConfiguration = .init(),
        deepLinks: DeepLinks? = nil,
        keyboardSettingsKeyPrefix: String? = nil
    ) {
        self.init(
            name: name,
            licenseKey: licenseKey,
            bundleId: bundleId,
            keyboardBundleId: keyboardBundleId,
            appGroupId: appGroupId,
            locales: locales,
            autocomplete: autocompleteConfiguration,
            deepLinks: deepLinks,
            keyboardSettingsKeyPrefix: keyboardSettingsKeyPrefix
        )
    }

    @available(*, deprecated, renamed: "autocomplete", message: "Migration Deprecation, will be removed in 9.1!")
    public var autocompleteConfiguration: AutocompleteConfiguration { autocomplete }

    /// The name of the app.
    public let name: String

    /// Your license key, if any.
    public let licenseKey: String?

    /// The app's bundle identifier.
    public let bundleId: String

    /// The app's keyboard bundle identifier
    public let keyboardBundleId: String

    /// The app's App Group identifier, if any.
    public let appGroupId: String?

    /// The locales to use in the app.
    public let locales: [Locale]

    /// App-specific deep links, if any.
    public let deepLinks: DeepLinks?

    /// The autocomplete configuration to use.
    public let autocomplete: AutocompleteConfiguration

    /// A custom keyboard settings key prefix, if any.
    public let keyboardSettingsKeyPrefix: String?
}

public extension KeyboardApp {

    /// This type can define app-specific deep links.
    ///
    /// You only have to provide an `app` url, and can leave
    /// the rest blank to use standard URLs.
    struct AutocompleteConfiguration {

        /// Create a custom autocomplete configuration.
        ///
        /// - Parameters:
        ///   - nextWordPredictionRequest: The next word prediction request to use, if any.
        public init(
            nextWordPredictionRequest: Autocomplete.NextWordPredictionRequest? = nil
        ) {
            self.nextWordPredictionRequest = nextWordPredictionRequest
        }

        /// The next word prediction request to use, if any.
        public let nextWordPredictionRequest: Autocomplete.NextWordPredictionRequest?
    }

    /// This type can define app-specific deep links.
    ///
    /// You only have to provide an `app` url, and can leave
    /// the rest blank to use standard URLs.
    struct DeepLinks {

        /// Create a custom keyboard deep links value.
        ///
        /// - Parameters:
        ///   - app: A deep link for opening the app, e.g. `x://`.
        ///   - dictation: A deep link for opening the app and starting dictation, by default `x://dictation`.
        ///   - keyboardSettings: A deep link for opening the app's keyboard settings screen, by default `x://keyboardSettings`.
        ///   - languageSettings: A deep link for opening the app's language settings screen, by default `x://languageSettings`.
        ///   - themeSettings: A deep link for opening the app's theme settings screen, by default `x://themeSettings`.
        public init(
            app: String,
            dictation: String? = nil,
            keyboardSettings: String? = nil,
            languageSettings: String? = nil,
            themeSettings: String? = nil
        ) {
            self.app = app
            self.dictation = dictation ?? "\(app)dictation"
            self.keyboardSettings = keyboardSettings ?? "\(app)keyboardSettings"
            self.languageSettings = languageSettings ?? "\(app)languageSettings"
            self.themeSettings = themeSettings ?? "\(app)themeSettings"
        }

        /// A deep link for opening the app.
        public let app: String

        /// A deep link for opening the app and starting dictation.
        public let dictation: String

        /// A deep link for opening the app's keyboard settings screen.
        public let keyboardSettings: String

        /// A deep link for opening the app's language settings screen.
        public let languageSettings: String

        /// A deep link for opening the app's theme settings screen.
        public let themeSettings: String
    }
}

public extension KeyboardApp.DeepLinks {

    /// A deep link for opening the app.
    var appURL: URL? { .init(string: app) }

    /// A deep link for opening the app and starting dictation.
    var dictationURL: URL? { .init(string: dictation) }

    /// A deep link for opening the app's keyboard settings screen.
    var keyboardSettingsURL: URL? { .init(string: keyboardSettings) }

    /// A deep link for opening the app's language settings screen.
    var languageSettingsURL: URL? { .init(string: languageSettings) }

    /// A deep link for opening the app's theme settings screen.
    var themeSettingsURL: URL? { .init(string: themeSettings) }
}

public extension KeyboardApp {

    /// This bundle ID wildcard that applies to all keyboard
    /// extensions for the app.
    var keyboardBundleIdWildcard: String {
        "\(bundleId).*"
    }
}

private extension KeyboardApp {

    static var keyboardKitDemo: Self {
        .init(
            name: "KeyboardKit",
            licenseKey: "abc123",
            bundleId: "com.keyboardkit.demo",
            appGroupId: "group.com.keyboardkit.demo",
            locales: [.english, .swedish, .persian]
        )
    }
}
