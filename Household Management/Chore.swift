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
    var users: [User] = []
    var setBy: User
    
    init(dueDate: Date, description: String, user: User, users: [User]){         self.dueDate = dueDate
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
}



class User {
    
}

