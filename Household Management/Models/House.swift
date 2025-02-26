//  House.swift
//  Household Management
//
//  Created by Alice Carlow on 24/02/2025.
//

// House.swift
import Foundation

struct User: Identifiable {
    var id = UUID() // Unique identifier for the user
    var name: String
    var email: String
    var chores: [Chore] = []
    
    mutating func addChore(newChore: Chore) {
        chores.append(newChore)
    }
}

struct Chore {
    var description: String
    var dueDate: Date
    var isComplete: Bool
}

class House {
    var name: String
    var users: [User]
    var chores: [Chore]
    
    init(name: String, users: [User] = [], chores: [Chore] = []) {
        self.name = name
        self.users = users
        self.chores = chores
    }
    
    func addUser(name: String, email: String) {
        let user = User(name: name, email: email)
        users.append(user)
    }
    
    func removeUser(user: User) {
        users.removeAll { $0.id == user.id }
    }
    
    func addChore(chore: Chore) {
        chores.append(chore)
    }
    
    func removeChore(chore: Chore) {
        chores.removeAll { $0.description == chore.description && $0.dueDate == chore.dueDate }
    }
    
    func assignChore(to user: User, chore: Chore) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            var mutableUser = users[index]
            mutableUser.addChore(newChore: chore)
            users[index] = mutableUser
        }
    }
    
    func getChoresForUser(user: User) -> [Chore] {
        return user.chores
    }
    
    func getIncompleteChores() -> [Chore] {
        return chores.filter { !$0.isComplete }
    }
    
    func getName() -> String {
        return name
    }
    
    func changeName(_ newName: String) {
        self.name = newName
    }
}
