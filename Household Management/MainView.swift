//
//  MainView.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem() {
                    Label("Home", systemImage: "house.fill")
                }
            UserView()
                .tabItem() {
                    Label("User", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    MainView()
        // .environmentObject(UserViewModel()) // UNCOMMENT WHEN USERVIEWMODEL.SWIFT IS IN SAME BRANCH
}
