//
//  UserView.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var currentUser: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome, \(currentUser.user.name)!")
                .font(.title)
                .fontWeight(.bold)
            Divider()
            HStack {
                Text("House:")
                    .font(.subheadline)
                Spacer()
                Text(currentUser.user.house)
                    .font(.subheadline)
            }
            Spacer() // move content to take up full space (not-vertically centred)
        }
        .padding()
    }
}

#Preview {
    UserView()
        .environmentObject(UserViewModel())
}
