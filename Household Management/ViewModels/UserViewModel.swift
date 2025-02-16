//
//  UserViewModel.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//  Handles User related logic seperately from UI logic, and can be used to interact with a db

import Foundation

class UserViewModel : ObservableObject {
    @Published var user: User
    
    init() {
        self.user = User(name: "John Smith", house: "123 Road")
    }
    
    func updateName(newName: String){
        user.name = newName;
    }
    
    func updateHouse (newHouse: String) {
        user.house = newHouse;
    }
}
