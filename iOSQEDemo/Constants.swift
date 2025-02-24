// Constants.swift
// Application-wide constants
// iOSQEDemo
// Created by Alex Ovsiyenko on 2025-02-21.

import Foundation

struct AppStrings {
    static let loginTitle = "Login"
    static let usernamePlaceholder = "Username"
    static let passwordPlaceholder = "Password"
    static let loginButtonTitle = "Login"
    static let welcomeMessage = "Welcome, %@!"
    static let invalidCredentialsMessage = "Invalid credentials"
    static let homeScreenMessage = "Welcome to the Home Screen!"
}

// Accessibility Identifiers
struct AccessibilityIdentifiers {
    static let usernameField = "usernameField"
    static let passwordField = "passwordField"
    static let loginButton = "loginButton"
    static let statusMessage = "statusMessage"
    static let homeScreenMessage = "homeScreenMessage"
}

// Timeout Constants
struct Timeout {
    static let defaultTimeout: TimeInterval = 5.0
}

