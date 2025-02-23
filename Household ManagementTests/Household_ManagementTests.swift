//
//  Household_ManagementTests.swift
//  Household ManagementTests
//
//  Created by Edward Petcher on 05/02/2025.
//

import Testing
import Foundation
import XCTest
@testable import Household_Management

struct Household_ManagementTests {
    class Test_chores {
        func testUnmarkComplete(){
            let user = User()
            let chore = Chore(dueDate: Date(), description: "Wash Dishes", user: user, users:[user])
            
            chore.markComplete()
            chore.UnmarkComplete()
            
            XCTAssertFalse(chore.isCompleted(), "The chore should be unmarked as complete")
            
        }
        func testIsCompleted(){
            let user = User()
            let chore = Chore(dueDate: Date(), description: "Wash Dishes", user: user, users: [user])
                
                XCTAssertFalse(chore.isCompleted(), "The chore should initially be marked as incomplete.")
                
                chore.markComplete()
                XCTAssertTrue(chore.isCompleted(), "The chore should be marked as complete after calling markComplete().")
            
        }
        func testGetDueDate() {
            let dueDate = Date(timeIntervalSince1970: 1000000000)  // Sample date
            let user = User()
            let chore = Chore(dueDate: dueDate, description: "Wash Dishes", user: user, users: [user])
            
            XCTAssertEqual(chore.getDueDate(), dueDate, "The due date should match the one that was set.")
        }
        
       /* func testGetUsers() {
            let user1 = User()
            let user2 = User()
            let chore = Chore(dueDate: Date(), description: "Wash Dishes", user: user1, users: [user1, user2])
            
            let users = chore.getUsers()
            
            XCTAssertEqual(users.count, 2, "There should be two users assigned to the chore.")
            XCTAssertTrue(users.contains(user1), "User 1 should be in the list of users.")
            XCTAssertTrue(users.contains(user2), "User 2 should be in the list of users.")
        }
        func testEmptyUserList() {
                let user = User()
                let chore = Chore(dueDate: Date(), description: "Vacuum", user: user, users: [])
                
                XCTAssertTrue(chore.getUsers().isEmpty, "The chore should have no users assigned.")
            }

            func testMultipleUsers() {
                let user1 = User()
                let user2 = User()
                let chore = Chore(dueDate: Date(), description: "Mow the Lawn", user: user1, users: [user1, user2])
                
                XCTAssertEqual(chore.getUsers().count, 2, "The chore should have two users assigned.")
            }

        */
        func testChoreInitialization() {
            let user = User()
            let dueDate = Date(timeIntervalSince1970: 1000000000)  // Sample date
            let chore = Chore(dueDate: dueDate, description: "Wash Dishes", user: user, users: [user])
            
            XCTAssertEqual(chore.dueDate, dueDate, "The due date should match the initialized value.")
            XCTAssertEqual(chore.description, "Wash Dishes", "The description should match the initialized value.")
            XCTAssertEqual(chore.users.count, 1, "There should be one user assigned to the chore.")
            /*XCTAssertEqual(chore.setBy, user, "The chore should be set by the specified user.")*/
        }
        func testMarkCompleteTwice() {
                let user = User()
                let chore = Chore(dueDate: Date(), description: "Clean Windows", user: user, users: [user])
                
                chore.markComplete()
                chore.markComplete()  // Marking again
                
                XCTAssertTrue(chore.isCompleted(), "The chore should remain marked as complete after multiple calls.")
            }

            func testUnmarkWithoutMarking() {
                let user = User()
                let chore = Chore(dueDate: Date(), description: "Take Out Trash", user: user, users: [user])
                
                chore.UnmarkComplete()  // Unmark without marking first
                
                XCTAssertFalse(chore.isCompleted(), "The chore should remain incomplete even after unmarking without prior marking.")
            }

            func testDescriptionUpdate() {
                let user = User()
                var chore = Chore(dueDate: Date(), description: "Old Description", user: user, users: [user])
                
                chore.description = "New Description"
                
                XCTAssertEqual(chore.description, "New Description", "The chore description should update correctly.")
            }
        func testOverdueChore(){
            
        }
        func testChoreReassignment(){
            
        }
        func testEmptyDescription(){
            
        }
        func testEdgeCaseFutureDate(){
            
        }
        func testDuplicateUsersinChore(){
            
        }
        func testDescription(){
            
        }
        func testUserRemovalFromChore(){
            
        }
    }
}
