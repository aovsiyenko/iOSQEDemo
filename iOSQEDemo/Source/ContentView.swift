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
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
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
                        isLoggedIn = true
                    } else {
                        loginMessage = "Invalid credentials"
                        isLoggedIn = false
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
                    .accessibilityIdentifier("statusMessage")
                    .padding()
                
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

struct HomeView: View {
    @State private var toggleState: Bool = false
    @State private var sliderValue: Double = 50
    @State private var stepperValue: Int = 1
    @State private var selectedOption: String = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Welcome to the Home Screen!")
                    .font(.title)
                    .accessibilityIdentifier("homeScreenMessage")
                
                // Toggle (Switch)
                Toggle("Enable Feature", isOn: $toggleState)
                    .accessibilityIdentifier("featureToggle")
                    .padding()
                
                // Slider
                VStack {
                    Text("Adjust Value: \(Int(sliderValue))")
                    Slider(value: $sliderValue, in: 0...100)
                        .accessibilityIdentifier("valueSlider")
                }
                
                // Stepper
                Stepper("Quantity: \(stepperValue)", value: $stepperValue, in: 1...10)
                    .accessibilityIdentifier("quantityStepper")
                    .padding()
                
                // Dropdown (Picker)
                Picker("Select Option", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .accessibilityIdentifier("optionPicker")
                
                // Button
                Button(action: {
                    print("Button tapped!")
                }) {
                    Text("Action Button")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .accessibilityIdentifier("actionButton")
                
                // Image
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                    .accessibilityIdentifier("starImage")
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

