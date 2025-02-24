//
// EnvLoader.swift
// Utility to load environment variables from a .env file
// iOSQEDemo
//
//  Created by Alex Ovsiyenko on 2025-02-21.
//

import Foundation

struct EnvLoader {
    
    // MARK: - Load .env File into a Dictionary
    /// Loads key-value pairs from a .env file into a dictionary
    /// - Returns: A dictionary containing environment variables
    static func loadEnv() -> [String: String] {
        var envVariables: [String: String] = [:]
        
        // Locate the .env file within the app bundle
        guard let filePath = Bundle.main.path(forResource: ".env", ofType: nil) else {
            print("⚠️ .env file not found")
            return envVariables
        }
        
        do {
            // Read the contents of the .env file as a string
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            // Split the file content into lines
            let lines = contents.split(separator: "\n")
            
            for line in lines {
                // Split each line into key and value components by the '=' character
                let parts = line.split(separator: "=", maxSplits: 1)
                if parts.count == 2 {
                    // Trim whitespace and newlines, then add to the dictionary
                    let key = String(parts[0]).trimmingCharacters(in: .whitespacesAndNewlines)
                    let value = String(parts[1]).trimmingCharacters(in: .whitespacesAndNewlines)
                    envVariables[key] = value
                }
            }
        } catch {
            print("⚠️ Error loading .env file: \(error.localizedDescription)")
        }
        
        return envVariables
    }
}
