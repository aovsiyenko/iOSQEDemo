//
//  EnvLoader.swift
//  iOSQEDemo
//
//  Created by Alex Ovsiyenko on 2025-02-21.
//

import Foundation

struct EnvLoader {
    
    static func loadEnv() -> [String: String] {
        var envVariables: [String: String] = [:]
        
        guard let filePath = Bundle.main.path(forResource: ".env", ofType: nil) else {
            print("⚠️ .env file not found")
            return envVariables
        }
        
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            let lines = contents.split(separator: "\n")
            
            for line in lines {
                let parts = line.split(separator: "=", maxSplits: 1)
                if parts.count == 2 {
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
