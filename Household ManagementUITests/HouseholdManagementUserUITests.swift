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
    }
    
    func testEditingUserInfo() throws {
        let editButton = app.buttons["Edit"]
        XCTAssertTrue(editButton.exists)
        editButton.tap()
        
        let nameField = app.textFields["Name"]
        let houseField = app.textFields["Address"]
        let emailField = app.textFields["Email"]
        let saveButton = app.buttons["Save"]
        
        XCTAssertTrue(nameField.exists)
        XCTAssertTrue(houseField.exists)
        XCTAssertTrue(emailField.exists)
        XCTAssertTrue(saveButton.exists)
        
        nameField.tap()
        nameField.typeText("Jane Doe")
        
        houseField.tap()
        houseField.typeText("456 Avenue")
        
        emailField.tap()
        emailField.typeText("jane@example.com")
        
        saveButton.tap()
        
        XCTAssertTrue(app.staticTexts["Jane Doe"].exists)
        XCTAssertTrue(app.staticTexts["Address: 456 Avenue"].exists)
        XCTAssertTrue(app.staticTexts["Email: jane@example.com"].exists)
    }
    
    func testCancelEditing() throws {
        let editButton = app.buttons["Edit"]
        editButton.tap()
        
        let cancelButton = app.buttons["Cancel"]
        XCTAssertTrue(cancelButton.exists)
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
