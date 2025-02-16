//
//  ColorScheme.swift
//  Bramble
//
//  Created by Keith Staines on 16/02/2025.
//

import SwiftUI

/// Enum representing different background colors for various areas in the UI.
/// Each case is designed to represent a specific area or function in the layout.
/// The names convey the intended use and context for these colors.
enum BackgroundColor {
    /// The primary background color, typically used for the main content area.
    /// It serves as the backdrop for the majority of the app's content.
    case primaryBackground

    /// The secondary background color, used for secondary UI components such as
    /// sidebars, navigation panels, or additional content areas.
    case secondaryBackground

    /// The background color specifically designed for form areas. These areas
    /// often contain user input fields or interactive elements.
    case formBackground

    /// The background color for supplementary content areas, such as extra panels
    /// or non-primary sections that still need a distinct background.
    case secondaryContentBackground

    /// Returns the corresponding `Color` for each background level.
    /// The exact color values are determined by the app's color assets, ensuring
    /// proper color management in both light and dark mode.
    var color: Color {
        switch self {
        case .primaryBackground:
            return Color("PrimaryBackground")  // Primary background for the main content area
        case .secondaryBackground:
            return Color("SecondaryBackground") // Background for secondary areas like navigation
        case .formBackground:
            return Color("FormBackground") // Background for form elements and user input
        case .secondaryContentBackground:
            return Color("SecondaryContentBackground") // Background for supplementary content
        }
    }
}

/// Enum representing different text colors used across the app.
/// The names are semantically designed to reflect the use and prominence of the text in different areas.
enum TextColor {
    /// The primary text color, typically used for body text, titles, and other prominent content.
    /// This color should stand out against the background and be easy to read.
    case primaryText

    /// The secondary text color, used for less prominent text like descriptions, metadata, or labels.
    /// This color has lower contrast and is meant to be more subtle.
    case secondaryText

    /// The accent text color, used for important, highlighted, or interactive text such as links, buttons, or call-to-action text.
    case accentText

    /// Returns the corresponding `Color` for each text color.
    /// The color is retrieved from the app’s color assets and adapts for light and dark mode.
    var color: Color {
        switch self {
        case .primaryText:
            return Color("PrimaryText")  // Main text color
        case .secondaryText:
            return Color("SecondaryText")  // Secondary text color for less prominent information
        case .accentText:
            return Color("AccentText")  // Highlighted or interactive text (e.g., links, buttons)
        }
    }
}
