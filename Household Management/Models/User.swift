//
//  User.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//

import Foundation

class User: ObservableObject {
    @Published private var _name: String;
    @Published private var _house: String; // change to House type
    
    var name: String {
        get { return _name }
        set { _name = newValue }
    }
    
    var house: String {
        get { return _house }
        set { _house = newValue }
    }
    
    init(name: String, house: String) {
        self._name = name
        self._house = house
    }
    
    /*func LoadData() {
        
    }
    
    func GetChores() -> Timetable {
        
    }
    
    func GetIOU() -> Payment {
        
    }
     */
}
