// LoginUITests.swift
// Comprehensive UI Tests for Login Screen with Emoji Enhancements
// iOSQEDemoUITests

import XCTest

final class LoginUITests: XCTestCase {

    let app = XCUIApplication()
    var loginPage: LoginPage!
    var homePage: HomePage!

    override func setUpWithError() throws {
        continueAfterFailure = false
        loginPage = LoginPage(app: app)
        homePage = HomePage(app: app)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }

    // MARK: - Test 1: Successful Login

    func testSuccessfulLogin() throws {
        print("🚀 Launching the app...")
        loginPage.launchApp()
        
        print("📲 Entering valid credentials...")
        _ = loginPage
            .enterUsername("testuser")
            .enterPassword("password")
            .tapLoginButton() // Use the result to avoid warning
        
        print("🔍 Verifying the home screen is displayed...")
        XCTAssertTrue(homePage.isDisplayed(), "✅ Home screen displayed successfully")
    }

    
    // MARK: - Test 2: Invalid Login

    func testInvalidLogin() throws {
        print("🚀 Launching the app...")
        loginPage.launchApp()
        
        print("📲 Entering invalid username and password...")
        loginPage
            .enterUsername("invalidUser")
            .enterPassword("wrongPassword")
            .tapLoginButton()
        
        print("🔍 Verifying the error message...")
        if loginPage.isErrorMessageDisplayed() {
            print("✅ Error message displayed correctly: \(AppStrings.invalidCredentialsMessage)")
        } else {
            XCTFail("❌ Expected error message not displayed")
        }
    }
    
    // MARK: - Test 3: Empty Username

    func testEmptyUsername() throws {
        print("🚀 Launching the app...")
        loginPage.launchApp()
        
        print("📲 Entering an empty username and a valid password...")
        loginPage
            .enterUsername("")
            .enterPassword("password")
            .tapLoginButton()
        
        print("🔍 Checking for error message about the required username...")
        XCTAssertTrue(loginPage.isErrorMessageDisplayed(), "❌ Username is required")
    }
    
    // MARK: - Test 4: Empty Password

    func testEmptyPassword() throws {
        print("🚀 Launching the app...")
        loginPage.launchApp()
        
        print("📲 Entering a valid username and an empty password...")
        loginPage
            .enterUsername("testuser")
            .enterPassword("")
            .tapLoginButton()
        
        print("🔍 Checking for error message about the required password...")
        XCTAssertTrue(loginPage.isErrorMessageDisplayed(), "❌ Password is required")
    }
    
    // MARK: - Test 5: UI Elements Validation

    func testUIElementsExistence() throws {
        print("🚀 Launching the app...")
        loginPage.launchApp()
        
        print("🔍 Validating the presence of all UI elements...")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.usernameTextField), "✅ Username field is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.passwordSecureField), "✅ Password field is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.loginButton), "✅ Login button is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.statusMessageLabel), "✅ Status message label is present")
    }
}

