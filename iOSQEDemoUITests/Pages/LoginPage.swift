// LoginPage.swift
// Page Object for the Login Screen
// iOSQEDemoUITests

import XCTest

final class LoginPage {
    
    // MARK: - Properties
    let app: XCUIApplication
    
    // UI Elements - Changed from private to internal (default)
    var usernameTextField: XCUIElement { app.textFields[AccessibilityIdentifiers.usernameField] }
    var passwordSecureField: XCUIElement { app.secureTextFields[AccessibilityIdentifiers.passwordField] }
    var loginButton: XCUIElement { app.buttons[AccessibilityIdentifiers.loginButton] }
    var statusMessageLabel: XCUIElement { app.staticTexts[AccessibilityIdentifiers.statusMessage] }
    
    // MARK: - Initializer
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Actions
    @discardableResult
    func launchApp() -> Self {
        app.launch()
        XCTAssertTrue(
            UIUtils.waitForElement(usernameTextField),
            "❌ Username text field not found on the Login Page after app launch"
        )
        print("✅ Login page displayed successfully")
        return self
    }
    
    @discardableResult
    func enterUsername(_ username: String) -> Self {
        usernameTextField.tap()
        usernameTextField.typeText(username)
        return self
    }
    
    @discardableResult
    func enterPassword(_ password: String) -> Self {
        passwordSecureField.tap()
        passwordSecureField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    func getDisplayedMessage() -> String? {
        return statusMessageLabel.label
    }

    func isErrorMessageDisplayed() -> Bool {
        return getDisplayedMessage() == AppStrings.invalidCredentialsMessage
    }
    
    func isDisplayed() -> Bool {
        let isVisible = UIUtils.waitForElement(usernameTextField)
        if !isVisible {
            XCTFail("❌ Username text field not found on the Login Page")
        }
        return isVisible
    }
}

