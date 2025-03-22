//
//  XCUIElement+Extensions.swift
//  Household Management
//
//  Created by James Sheppard on 22/03/2025.
//

import XCTest

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else { return }
        
        // Tap to focus on the text field
        self.tap()
        
        // Simulate delete key for each character
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
    }
}
