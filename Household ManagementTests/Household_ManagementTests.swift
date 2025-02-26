//
//  Household_ManagementTests.swift
//  Household ManagementTests
//
//  Created by Edward Petcher on 05/02/2025.
//

import Foundation
import XCTest
@testable import Household_Management

final class Household_ManagementTests: XCTestCase {
    // Test adding a user
        func testAddUser() {
            let house = House(name: "3 West Avenue")
            
            // Act
            house.addUser(name: "Jane Doe", email: "janedoe@example.com")
            
            // Assert
            XCTAssertEqual(house.users.count, 1)
            XCTAssertEqual(house.users.first?.name, "Jane Doe")
            XCTAssertEqual(house.users.first?.email, "janedoe@example.com")
        }
        
        // Test removing a user
        func testRemoveUser() {
            let house = House(name: "3 West Ave", users: [User(name: "Jane Doe", email: "janedoe@example.com")])
            
            // Act
            let userToRemove = house.users.first!
            house.removeUser(user: userToRemove)
            
            // Assert
            XCTAssertEqual(house.users.count, 0)
        }

        // Test changing the house name
        func testChangeHouseName() {
            let house = House(name: "3 West Ave")
            
            // Act
            house.changeName("4 East Ave")
            
            // Assert
            XCTAssertEqual(house.name, "4 East Ave")
        }
    }
