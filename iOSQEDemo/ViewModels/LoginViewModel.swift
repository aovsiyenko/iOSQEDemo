//
//  LoginViewModel.swift
//  iOSQEDemo
//
//  Created by Alex Ovsiyenko on 2025-02-21.
//
import Foundation

class LoginViewModel: ObservableObject {
    
    // MARK: - Environment Variables
    private let validUsername: String
    private let validPassword: String
    
    // MARK: - Published Properties
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginMessage: String = ""
    
    // MARK: - Initialization
    init() {
        let env = EnvLoader.loadEnv()
        validUsername = env["USERNAME"] ?? ""
        validPassword = env["PASSWORD"] ?? ""
    }
    
    // MARK: - Public Methods
    func login() {
        if username == validUsername && password == validPassword {
            loginMessage = String(format: AppStrings.welcomeMessage, username)
        } else {
            loginMessage = AppStrings.invalidCredentialsMessage
        }
    }
}

