// TestConstants.swift
// Application-wide constants for UI Tests
// iOSQEDemoUITests

import Foundation
import iOSQEDemo

// MARK: - Strings displayed in the app
struct AppStrings {
    static let loginTitle = "Login"
    static let invalidCredentialsMessage = "Invalid credentials"
    static let homeScreenMessage = "Welcome to the Home Screen!"
    static let welcomeMessageFormat = "Welcome, %@!"
}

// MARK: - Accessibility Identifiers used in the app
struct AccessibilityIdentifiers {
    
    // MARK: - Login Screen
    static let usernameField = "usernameField"
    static let passwordField = "passwordField"
    static let loginButton = "loginButton"
    static let statusMessage = "statusMessage"
    
    // MARK: - Home Screen
    static let homeScreenMessage = "homeScreenMessage"
    static let featureToggle = "featureToggle"
    static let valueSlider = "valueSlider"
    static let quantityStepper = "quantityStepper"
    static let optionPicker = "optionPicker"
    static let actionButton = "actionButton"
    static let starImage = "starImage"
}

// MARK: - Timeout configuration for UI waits
struct Timeout {
    static let defaultTimeout: TimeInterval = 5.0
}

// MARK: - Environment Variables
struct TestCredentials {
    static let validUsername = EnvLoader.loadEnv()["VALID_USERNAME"] ?? "testuser"
    static let validPassword = EnvLoader.loadEnv()["VALID_PASSWORD"] ?? "password"
    static let invalidUsername = EnvLoader.loadEnv()["INVALID_USERNAME"] ?? "invalidUser"
    static let invalidPassword = EnvLoader.loadEnv()["INVALID_PASSWORD"] ?? "wrongPassword"
}

