//
//  ChoreTests.swift
//  Household Management
//
//  Created by James Sheppard on 22/03/2025.
//


import XCTest
@testable import Household_Management

class ChoreTests: XCTestCase {
    
    var user1: User!
    var user2: User!
    var chore: Chore!
    var timetable: TimeTable!
    
    override func setUp() {
        super.setUp()
        user1 = User(name: "Alice", house: "123 Street", email: "alice@example.com")
        user2 = User(name: "Bob", house: "123 Street", email: "bob@example.com")
        chore = Chore(dueDate: Date(), description: "Take out the trash", user: user1, users: [user1, user2])
        timetable = TimeTable()
    }
    
    override func tearDown() {
        chore = nil
        user1 = nil
        user2 = nil
        timetable = nil
        super.tearDown()
    }
    
    func testChoreInitialization() {
        XCTAssertEqual(chore.description, "Take out the trash")
        XCTAssertEqual(chore.setBy.name, "Alice")
        XCTAssertEqual(chore.users.count, 2)
        XCTAssertFalse(chore.isComplete)
    }
    
    func testMarkComplete() {
        chore.markComplete()
        XCTAssertTrue(chore.isCompleted())
    }
    
    func testUnmarkComplete() {
        chore.markComplete()
        chore.UnmarkComplete()
        XCTAssertFalse(chore.isCompleted())
    }
    
    func testGetDueDate() {
        let expectedDate = chore.dueDate
        XCTAssertEqual(chore.getDueDate(), expectedDate)
    }
    
    func testGetUsers() {
        XCTAssertEqual(chore.getUsers().count, 2)
    }
    
    func testGetSetByUser() {
        XCTAssertEqual(chore.getUser().name, "Alice")
    }
    
    func testTimeTableAddChore() {
        timetable.addChore(chore: chore)
        XCTAssertEqual(timetable.getTable().count, 1)
        XCTAssertEqual(timetable.getTable().first?.description, "Take out the trash")
    }
    
    func testTimeTableRemoveChore() {
        timetable.addChore(chore: chore)
        timetable.removeChore(index: 0)
        XCTAssertEqual(timetable.getTable().count, 0)
    }
    func testIsCompletedInitialState(){
        XCTAssertFalse(chore.isCompleted(), "This chore should initially be marked as incomplete. ")
    }
    func testMarkCompleteChangesState() {
           chore.markComplete()
           XCTAssertTrue(chore.isCompleted(), "The chore should be marked as complete after calling markComplete().")
       }
    func testDescriptionUpdate() {
            chore.description = "New Description"
            XCTAssertEqual(chore.description, "New Description", "The chore description should update correctly.")
        }
}
