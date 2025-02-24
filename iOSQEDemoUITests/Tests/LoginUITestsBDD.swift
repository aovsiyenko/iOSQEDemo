// LoginUITestsBDD.swift
// UI Tests for Login Screen with BDD Style
// iOSQEDemoUITests

import XCTest

final class LoginUITestsBDD: XCTestCase {

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

    // MARK: - Test Case 1: Successful Login
    
    /// Test Name: Successful Login with Valid Credentials
    /// Given the app is launched on the login page
    /// When the user enters valid credentials and taps the login button
    /// Then the home screen should be displayed with the welcome message
    func testSuccessfulLogin() throws {
        print("🚀 Given the app is launched on the login page")
        loginPage.launchApp()
        
        print("📲 When the user enters valid credentials and taps the login button")
        loginPage
            .enterUsername(TestCredentials.validUsername)
            .enterPassword(TestCredentials.validPassword)
            .tapLoginButton()
        
        print("🔍 Then the home screen should be displayed with the welcome message")
        XCTAssertTrue(homePage.isDisplayed(), "✅ Home screen displayed successfully")
        let expectedMessage = String(format: AppStrings.homeScreenMessage)
        XCTAssertEqual(homePage.getDisplayedMessage(), expectedMessage)
    }
    
    // MARK: - Test Case 2: Invalid Login
    
    /// Test Name: Invalid Login with Incorrect Credentials
    /// Given the app is launched on the login page
    /// When the user enters invalid credentials and taps the login button
    /// Then an error message "Invalid credentials" should be displayed
    func testInvalidLogin() throws {
        print("🚀 Given the app is launched on the login page")
        loginPage.launchApp()
        
        print("📲 When the user enters invalid credentials and taps the login button")
        loginPage
            .enterUsername(TestCredentials.invalidUsername)
            .enterPassword(TestCredentials.invalidPassword)
            .tapLoginButton()
        
        print("🔍 Then an error message should be displayed")
        XCTAssertTrue(loginPage.isErrorMessageDisplayed(), "❌ Expected error message not displayed")
    }
    
    // MARK: - Test Case 3: Empty Username
    
    /// Test Name: Attempt Login with Empty Username
    /// Given the app is launched on the login page
    /// When the user leaves the username empty and enters a password
    /// Then an error message indicating a required username should be displayed
    func testEmptyUsername() throws {
        print("🚀 Given the app is launched on the login page")
        loginPage.launchApp()
        
        print("📲 When the user leaves the username empty and enters a password")
        loginPage
            .enterUsername("")
            .enterPassword(TestCredentials.validPassword)
            .tapLoginButton()
        
        print("🔍 Then an error message indicating a required username should be displayed")
        XCTAssertTrue(loginPage.isErrorMessageDisplayed(), "❌ Username is required")
    }
    
    // MARK: - Test Case 4: Empty Password
    
    /// Test Name: Attempt Login with Empty Password
    /// Given the app is launched on the login page
    /// When the user enters a username and leaves the password empty
    /// Then an error message indicating a required password should be displayed
    func testEmptyPassword() throws {
        print("🚀 Given the app is launched on the login page")
        loginPage.launchApp()
        
        print("📲 When the user enters a username and leaves the password empty")
        loginPage
            .enterUsername(TestCredentials.validUsername)
            .enterPassword("")
            .tapLoginButton()
        
        print("🔍 Then an error message indicating a required password should be displayed")
        XCTAssertTrue(loginPage.isErrorMessageDisplayed(), "❌ Password is required")
    }
    
    // MARK: - Test Case 5: UI Elements Validation
    
    /// Test Name: Verify Presence of UI Elements on the Login Page
    /// Given the app is launched on the login page
    /// When the page loads completely
    /// Then all expected UI elements should be visible
    func testUIElementsExistence() throws {
        print("🚀 Given the app is launched on the login page")
        loginPage.launchApp()
        
        print("🔍 Then all expected UI elements should be visible")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.usernameTextField), "✅ Username field is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.passwordSecureField), "✅ Password field is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.loginButton), "✅ Login button is present")
        XCTAssertTrue(UIUtils.waitForElement(loginPage.statusMessageLabel), "✅ Status message label is present")
    }
}

