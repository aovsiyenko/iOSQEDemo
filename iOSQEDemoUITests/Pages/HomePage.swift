// HomePage.swift
// Page Object for the Home Screen
// iOSQEDemoUITests

import XCTest

final class HomePage {
    
    // MARK: - Properties
    let app: XCUIApplication
    
    // UI Elements
    var homeScreenMessage: XCUIElement { app.staticTexts[AccessibilityIdentifiers.homeScreenMessage] }
    var featureToggle: XCUIElement { app.switches[AccessibilityIdentifiers.featureToggle] }
    var valueSlider: XCUIElement { app.sliders[AccessibilityIdentifiers.valueSlider] }
    var quantityStepper: XCUIElement { app.steppers[AccessibilityIdentifiers.quantityStepper] }
    var optionPicker: XCUIElement { app.pickers[AccessibilityIdentifiers.optionPicker] }
    var actionButton: XCUIElement { app.buttons[AccessibilityIdentifiers.actionButton] }
    var starImage: XCUIElement { app.images[AccessibilityIdentifiers.starImage] }
    
    // MARK: - Initializer
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Verifications
    
    /// Checks if the home screen is displayed by verifying the presence of the home screen message
    func isDisplayed() -> Bool {
        let isVisible = UIUtils.waitForElement(homeScreenMessage)
        if !isVisible {
            XCTFail("❌ Home screen message not found")
        }
        return isVisible
    }
    
    /// Retrieves the displayed message on the home screen
    func getDisplayedMessage() -> String? {
        return homeScreenMessage.label
    }
    
    /// Toggles the feature switch to the desired state
    func toggleFeature(on: Bool) {
        if featureToggle.value as? String != (on ? "1" : "0") {
            featureToggle.tap()
        }
    }
    
    /// Sets the slider to a specific value
    func setSlider(to value: CGFloat) {
        valueSlider.adjust(toNormalizedSliderPosition: value)
    }
    
    /// Increments the stepper by a given number of times
    func incrementStepper(times: Int) {
        for _ in 0..<times {
            quantityStepper.buttons["Increment"].tap()
        }
    }
    
    /// Selects an option in the picker
    func selectOption(_ option: String) {
        optionPicker.pickerWheels.element.adjust(toPickerWheelValue: option)
    }
    
    /// Taps the action button
    func tapActionButton() {
        actionButton.tap()
    }
    
    /// Checks if the star image is visible on the screen
    func isStarImageDisplayed() -> Bool {
        return UIUtils.waitForElement(starImage)
    }
}

