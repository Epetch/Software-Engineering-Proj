//
//  Household_ManagementApp.swift
//  Household Management
//
//  Created by Edward Petcher on 05/02/2025.
//

import SwiftUI

@main
struct Household_ManagementApp: App {
    @StateObject var currentUser = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(currentUser) // puts current user into the app environment (can be used in all views)
        }
    }
}
