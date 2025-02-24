//
//  LoginViewModelTests.swift
//  iOSQEDemo
//
//  Created by Alex Ovsiyenko on 2025-02-21.
//

import XCTest
@testable import iOSQEDemo

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var env: [String: String]!
    
    override func setUpWithError() throws {
        // Initialize the ViewModel before each test
        viewModel = LoginViewModel()
        
        // Load environment variables using EnvLoader
        env = EnvLoader.loadEnv()
    }
    
    override func tearDownWithError() throws {
        // Clean up resources after each test
        viewModel = nil
    }
    
    // MARK: - Unit Test for Successful Login
    func testLoginSuccess() {
        // Given: Valid username and password from .env file
        viewModel.username = env["USERNAME"] ?? ""
        viewModel.password = env["PASSWORD"] ?? ""
        
        // When: Attempting to login with correct credentials
        viewModel.login()
        
        // Then: Login message should display a welcome message
        XCTAssertEqual(viewModel.loginMessage, "Welcome, testuser!", "Expected welcome message for valid credentials")
    }
    
    // MARK: - Unit Test for Failed Login
    func testLoginFailure() {
        // Given: Invalid username and password from .env file
        viewModel.username = env["INVALID_USERNAME"] ?? ""
        viewModel.password = env["INVALID_PASSWORD"] ?? ""
        
        // When: Attempting to login with incorrect credentials
        viewModel.login()
        
        // Then: Login message should display an invalid credentials message
        XCTAssertEqual(viewModel.loginMessage, "Invalid credentials", "Expected 'Invalid credentials' message for invalid login")
    }
    
    // MARK: - Edge Case: Empty Username or Password
    func testEmptyUsernameOrPassword() {
        // Given: Empty username and password
        viewModel.username = ""
        viewModel.password = ""
        
        // When: Attempting to login with empty fields
        viewModel.login()
        
        // Then: Login should fail due to empty input
        XCTAssertEqual(viewModel.loginMessage, "Invalid credentials", "Expected 'Invalid credentials' message when fields are empty")
    }
}

