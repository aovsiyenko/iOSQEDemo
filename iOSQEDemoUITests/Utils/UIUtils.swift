// UIUtils.swift
// Utility functions for UI tests
// iOSQEDemoUITests

import XCTest

final class UIUtils {
    
    // MARK: - Wait for Element to Appear
    
    /// Waits for an element to appear within the default timeout
    /// - Parameters:
    ///   - element: The UI element to wait for
    ///   - timeout: Optional timeout, defaults to Timeout.defaultTimeout
    /// - Returns: True if the element appears within the timeout
    static func waitForElement(_ element: XCUIElement, timeout: TimeInterval = Timeout.defaultTimeout) -> Bool {
        let exists = element.waitForExistence(timeout: timeout)
        if !exists {
            XCTFail("Element \(element) did not appear within \(timeout) seconds.")
        }
        return exists
    }
    
    // MARK: - Soft Assertions
    
    private static var softAssertionErrors: [String] = []
    
    /// Softly asserts a condition, logging an error instead of failing the test immediately
    static func softAssert(_ condition: Bool, _ message: String) {
        if !condition {
            softAssertionErrors.append(message)
            XCTContext.runActivity(named: "Soft Assertion Failed") { _ in
                XCTFail(message)
            }
        }
    }
    
    /// Fails the test if there are any soft assertion errors
    static func assertNoSoftFailures() {
        if !softAssertionErrors.isEmpty {
            let errorMessage = "Soft Assertions Failed:\n" + softAssertionErrors.joined(separator: "\n")
            softAssertionErrors.removeAll()
            XCTFail(errorMessage)
        }
    }
}

