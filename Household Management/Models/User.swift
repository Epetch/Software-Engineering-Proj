//
//  User.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//  Edited by Ellie Deaner 18/2/2025

import Foundation

class User: ObservableObject {
    @Published private var _name: String
    @Published private var _house: String
    @Published private var _email: String
    @Published var chores: [Chore] = [];
    

    var name: String {
        get { return _name }
        set { _name = newValue }
    }

    var house: String {
        get { return _house }
        set { _house = newValue }
    }

    var email: String {
        get { return _email }
        set { _email = newValue }
    }

    
    
    init(name: String, house: String, email: String) {
        self._name = name
        self._house = house
        self._email = email
        self.chores = [
            
            Chore(dueDate: Date.distantFuture, description: "Hoovering", user: self, users: [self]),
            Chore(dueDate: Date.distantFuture, description: "Mopping", user: self, users: [self])
        ]
    }
    
    func AddChore(newChore: Chore) {
        self.chores.append(newChore);
    }
    
    func RemoveChore(chore: Chore) {
        // will work better with a chore ID property
        self.chores = self.chores.filter({ $0.description != chore.description && $0.dueDate != chore.dueDate })
    }
    
    //func GetChores() {
        //}
        
    //func GetIOU() {
        
      //  }
}

