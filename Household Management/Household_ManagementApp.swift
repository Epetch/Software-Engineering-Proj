//
//  Household_ManagementApp.swift
//  Household Management
//
//  Created by Edward Petcher on 05/02/2025.
//

import SwiftUI

@main
struct Household_ManagementApp: App {
    // @StateObject var currentUser = UserViewModel() // UNCOMMENT WHEN USERVIEWMODEL.SWIFT IS IN SAME BRANCH
    
    var body: some Scene {
        WindowGroup {
            MainView()
                // .environmentObject(currentUser) // UNCOMMENT WHEN USERVIEWMODEL.SWIFT IS IN SAME BRANCH - puts current user into the app environment (can be used in all views)
        }
    }
}
