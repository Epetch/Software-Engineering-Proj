//
//  HouseholdManagementUserUITests.swift
//  Household Management
//
//  Created by Ellie Deaner on 02/03/2025.
//

import XCTest

class UserViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        // Launch app before each test
        app = XCUIApplication()
        app.launch()
        // go to user page
        app.tabBars.buttons["User"].tap()
    }
    
    func testEditingUserInfo() throws {
        let editButton = app.buttons["Edit"]
        XCTAssertTrue(editButton.exists)
        editButton.tap()
        
        let nameField = app.textFields["Name"]
        let houseField = app.textFields["Address"]
        let emailField = app.textFields["Email"]
        let saveButton = app.buttons["Save"].firstMatch
        
        XCTAssertTrue(nameField.exists)
        XCTAssertTrue(houseField.exists)
        XCTAssertTrue(emailField.exists)
        
        nameField.clearText()
        nameField.typeText("Jane Doe")
        
        houseField.clearText()
        houseField.typeText("456 Avenue")
        
        emailField.clearText()
        emailField.typeText("jane@example.com")
        
        // hide keyboard by simulating enter
        emailField.typeText("\n")
        
        //XCTAssertTrue(saveButton.waitForExistence(timeout: 5))
        //saveButton.ensureVisible() // Ensure it's visible before tapping
        
        if !saveButton.isHittable {
            app.swipeUp()
        }
        saveButton.tap()
        
        XCTAssertTrue(app.staticTexts["Jane Doe"].exists)
        XCTAssertTrue(app.staticTexts["Address: 456 Avenue"].exists)
        XCTAssertTrue(app.staticTexts["Email: jane@example.com"].exists)
    }
    
    func testCancelEditing() throws {
        let editButton = app.buttons["Edit"]
        editButton.tap()
        
        let cancelButton = app.buttons["Cancel"].firstMatch
        //XCTAssertTrue(cancelButton.waitForExistence(timeout: 5))
        //cancelButton.ensureVisible() // Ensure it's visible before tapping
    
        if !cancelButton.isHittable {
            app.swipeUp()
        }
        
        cancelButton.tap()
        
        XCTAssertFalse(app.textFields["Name"].exists)
    }
    
    func testChoresTabSelection() throws {
        let choresButton = app.buttons["Chores"]
        let paymentsButton = app.buttons["Payments"]
        
        XCTAssertTrue(choresButton.exists)
        XCTAssertTrue(paymentsButton.exists)
        
    
    }
}
