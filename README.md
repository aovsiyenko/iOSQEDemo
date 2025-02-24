# iOSQEDemo

An iOS demo project showcasing **Quality Engineering (QE)** best practices using **XCtest**, **XCUITest**, and **SwiftUI**.

---

## 📱 **Project Overview**
This project demonstrates:
- 🧪 **Unit Testing:** Using **XCtest** for **business logic validation**.
- 🎯 **UI Testing:** Using **XCUITest** with **Page Object Model (POM)**.
- 🔐 **Environment Management:** Using **.env files** for **sensitive data**.
- 🚦 **Best Practices:** Test organization, maintainability, and modularity.

---

## 🚀 **Getting Started**

### **1. Prerequisites**
- **Xcode 14+** installed on macOS.
- **iOS Simulator** or a **physical device**.
- **Git** for version control.

### **2. Clone the Repository**
```bash
git clone https://github.com/aovsiyenko/iOSQEDemo.git
cd iOSQEDemo
```

### **3. Open the Project in Xcode**
```bash
open iOSQEDemo.xcodeproj
```

### **4. Run the App**
- **Select a simulator** (e.g., **iPhone 14**).
- Press **Command + R** to **build and run** the app.

### **5. Run Tests**
- **Unit Tests:**
```bash
Command + U
```
- **UI Tests:** Run from the **Xcode Test Navigator** or using the **diamond icons** next to **test methods**.

---

## 🧑‍💻 **Project Structure**
```
iOSQEDemo/
├─ Source/                 # Main app code
├─ ViewModels/             # Business logic
├─ Tests/
│   ├─ UnitTests/          # Unit Tests with XCtest
│   └─ UITests/            # UI Tests with XCUITest
└─ .env                    # Environment variables
```

---

## 🧠 **Key Concepts**

### **1. XCtest (Unit Testing)**
- [Apple Developer Documentation](https://developer.apple.com/documentation/xctest)
- [Introduction to Unit Testing in Swift](https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods)

### **2. XCUITest (UI Testing)**
- [Apple UI Testing Guide]([https://developer.apple.com/documentation/xctest/ui_testing](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html))
- [Page Object Model in XCUITest](https://www.hackingwithswift.com/articles/148/xcode-ui-testing-cheat-sheet)

### **3. SwiftUI**
- [SwiftUI Official Documentation](https://developer.apple.com/documentation/swiftui)
- [Building Forms and Inputs](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)

### **4. Environment Management**
- [Using .env Files in Swift](https://medium.com/@ganeshspatil/how-to-use-env-file-in-ios-project-413feb7c2e7b)

---

## 🧪 **Running Tests**

### **1. Unit Tests**
```bash
Command + U
```
- Navigate to **LoginViewModelTests.swift** under **Tests/UnitTests**.

### **2. UI Tests**
- Go to **Tests/UITests**.
- Select **LoginUITests.swift**.
- **Run all tests** or **individual tests** using the **diamond icon**.

---

## 🌳 **Environment Variables**
### **.env File Structure:**
```env
USERNAME=...
PASSWORD=...
INVALID_USERNAME=wronguser
INVALID_PASSWORD=wrongpassword
```

### **Add .env to .gitignore:**
```plaintext
.env
```

---

## 🚦 **Best Practices Followed:**
- **Centralized Test Data:** Using **.env files**.
- **Separation of Concerns:** **UI**, **business logic**, and **test code** are **separated**.
- **Code Reuse:** Page Object Model (**POM**) for **UI testing**.
- **Test Isolation:** Each **test method** is **independent**.

---

## 💡 **Additional Resources:**
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Testing with Xcode](https://developer.apple.com/documentation/xcode/testing-your-apps-in-xcode)
- [Swift.org](https://swift.org/)

---


## ✨ **Author:**
**Alex Ovsiyenko**

