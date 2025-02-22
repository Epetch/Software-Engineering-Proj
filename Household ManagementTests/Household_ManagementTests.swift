//
//  Household_ManagementTests.swift
//  Household ManagementTests
//
//  Created by Edward Petcher on 05/02/2025.
//

import Testing
import XCTest
@testable import Household_Management

struct Household_ManagementTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    
}

class Test_User: XCTestCase {
    private var user: User!
    private var _name = "John Doe";
    private var _house = "Test Address"; // change to house class when implemented
    private var _email = "test@gmail.com";
    
    override func setUp() {
        super.setUp()
        user = User(name: _name, house: _house, email: _email);
    }
    
    func testInitialisation(){
        XCTAssertEqual(user.name, _name, "User.name and name should be the same");
        XCTAssertEqual(user.house, _house, "User.house and house should be the same");
        XCTAssertEqual(user.email, _email, "User.email and email should be the same");
    }
    func testUpdateProperties(){
        let newName = "Jane Doe";
        user.name = newName;
        XCTAssertEqual(user.name, newName, "user.name should be updated to newName")
        // update house
        let newHouse = "123 Road";
        user.house = newHouse;
        XCTAssertEqual(user.house, newHouse, "user.house should be updated to newHouse")
        // update email
        let newEmail = "test2@example.com";
        user.email = newEmail;
        XCTAssertEqual(user.email, newEmail, "user.email should be updated to newEmail")
    }
    
    func testAddChore() {
        let newChore = Chore(name: "Washing", dueDate: "Tuesday", isCompleted: false);
        self.user.AddChore(newChore: newChore);
        XCTAssertEqual(self.user.chores.last!.name, newChore.name)
        XCTAssertEqual(self.user.chores.last!.dueDate, newChore.dueDate)
        XCTAssertEqual(self.user.chores.last!.isCompleted, newChore.isCompleted)
    }
    func testRemoveChore() {
        let chore = Chore(name: "Washing", dueDate: "Tuesday", isCompleted: false);
        self.user.AddChore(newChore: chore)
        self.user.RemoveChore(chore: chore)
        XCTAssertTrue(self.user.chores.isEmpty)
    }
    
}
