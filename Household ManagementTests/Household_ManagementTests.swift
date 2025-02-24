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
        private var user: User!;
        private var _name = "John Doe";
        private var _house = "Test Address"; // change to house class when implemented
        private var _email = "test@gmail.com";
        
        /* // uncomment if changing from this format to the format used below for Test_User
         override func setUp() {
             super.setUp()
             user = User(name: _name, house: _house, email: _email);
         }
         */
        
        init(){ // remove if setUp func being used
            user = User(name: _name, house: _house, email: _email);
        }
        
        func testUnmarkComplete(){
            let chore = Chore(dueDate: Date(), description: "Wash Dishes", user: self.user, users:[self.user])
            
            chore.markComplete()
            chore.UnmarkComplete()
            
            XCTAssertFalse(chore.isCompleted(), "The chore should be unmarked as complete")
            
        }
        func testIsCompleted(){
            let chore = Chore(dueDate: Date(), description: "Wash Dishes", user: self.user, users: [self.user])
                
                XCTAssertFalse(chore.isCompleted(), "The chore should initially be marked as incomplete.")
                
                chore.markComplete()
                XCTAssertTrue(chore.isCompleted(), "The chore should be marked as complete after calling markComplete().")
            
        }
        func testGetDueDate() {
            let dueDate = Date(timeIntervalSince1970: 1000000000)  // Sample date
            let chore = Chore(dueDate: dueDate, description: "Wash Dishes", user: self.user, users: [self.user])
            
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
            let dueDate = Date(timeIntervalSince1970: 1000000000)  // Sample date
            let chore = Chore(dueDate: dueDate, description: "Wash Dishes", user: self.user, users: [self.user])
            
            XCTAssertEqual(chore.dueDate, dueDate, "The due date should match the initialized value.")
            XCTAssertEqual(chore.description, "Wash Dishes", "The description should match the initialized value.")
            XCTAssertEqual(chore.users.count, 1, "There should be one user assigned to the chore.")
            /*XCTAssertEqual(chore.setBy, user, "The chore should be set by the specified user.")*/
        }
        func testMarkCompleteTwice() {
                let chore = Chore(dueDate: Date(), description: "Clean Windows", user: self.user, users: [self.user])
                
                chore.markComplete()
                chore.markComplete()  // Marking again
                
                XCTAssertTrue(chore.isCompleted(), "The chore should remain marked as complete after multiple calls.")
            }
          
        func testUnmarkWithoutMarking() {
                let chore = Chore(dueDate: Date(), description: "Take Out Trash", user: self.user, users: [self.user])
                
                chore.UnmarkComplete()  // Unmark without marking first
                
                XCTAssertFalse(chore.isCompleted(), "The chore should remain incomplete even after unmarking without prior marking.")
        }
      
        func testDescriptionUpdate() {
                var chore = Chore(dueDate: Date(), description: "Old Description", user: self.user, users: [self.user])
                
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
        let newChore = Chore(dueDate: Date.distantFuture, description: "Washing", user: self.user, users: [self.user])
        self.user.AddChore(newChore: newChore);
        XCTAssertEqual(self.user.chores.last!.description, newChore.description)
        XCTAssertEqual(self.user.chores.last!.dueDate, newChore.dueDate)
    }
    func testRemoveChore() {
        
        let chore = Chore(dueDate: Date.distantFuture, description: "Washing", user: self.user, users: [self.user]);
        self.user.AddChore(newChore: chore)
        self.user.RemoveChore(chore: chore)
        XCTAssertTrue(self.user.chores.isEmpty)
    }
}
