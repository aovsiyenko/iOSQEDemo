//
//  ContentView.swift
//  iOSQEDemo
//
//  Created by Alex Ovsiyenko on 2025-02-21.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $username)
                .accessibilityIdentifier("usernameField")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .accessibilityIdentifier("passwordField")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if username == "testuser" && password == "password" {
                    loginMessage = "Welcome, \(username)!"
                } else {
                    loginMessage = "Invalid credentials"
                }
            }) {
                Text("Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .accessibilityIdentifier("loginButton")
            
            Text(loginMessage)
                .accessibilityIdentifier("welcomeMessage")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
