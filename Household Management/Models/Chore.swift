//
//  Chore.swift
//  Household Management
//
//  Created by Edward Petcher on 11/02/2025.
//

import Foundation

class Chore {
    var dueDate: Date
    var description: String
    var isComplete: Bool = false
    var users: [User] = [] //the list of users that can complete the chore
    var setBy: User //the user who set the chore
    
    init(dueDate: Date, description: String, user: User, users: [User]){ //the contructor for the chore class
        self.dueDate = dueDate
        self.description = description
        self.setBy = user
        self.users = users
    }
    
    func markComplete(){
        isComplete = true
    }
    
    func UnmarkComplete(){
        isComplete = false
    }
    
    func isCompleted() -> Bool {
        return isComplete
    }
    
    func getDueDate() -> Date {
        return dueDate
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func getUser() -> User {
        return setBy
    }
}


class TimeTable {
    
    var table: [Chore] = []
    
    init(){
        
    }
    func addChore(chore: Chore){
        var isAppended: Bool = false
        var count: Int = 0
        while (!isAppended){
            if table.isEmpty{
                table.append(chore)
                isAppended = true
            }
            else if table[count].getDueDate() > chore.getDueDate(){
                table.insert(chore, at: count)
                isAppended = true
            }
            else if count == table.count-1{
                table.append(chore)
                isAppended = true
            }
            count += 1
        }
    }
    
    func getTable() -> [Chore] {
        return table
    }
    
    func removeChore(index: Int){
        table.remove(at: index)
    }
    
}


