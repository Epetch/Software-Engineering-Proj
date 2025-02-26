//
//  ContentView.swift
//  Household Management
//
//  Created by Edward Petcher on 05/02/2025.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var house = House(name: "3 West Avenue", users: [User(name: "Alice", email: "alice@email.com")])
    @State private var newTenantName = ""
    @State private var newTenantEmail = ""
    @State private var newHouseName = ""
    @State private var isEditingName = false // Track input box visibility

    var body: some View {
        NavigationView {
            VStack {
                // Show text field only if isEditingName is true
                if isEditingName {
                    TextField("New House Name", text: $newHouseName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Save") {
                        if !newHouseName.isEmpty {
                            house.changeName(newHouseName)
                            newHouseName = ""
                        }
                        isEditingName = false // Hide input after saving
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.pink.opacity(0.5))
                } else {
                    Button("Change Name") {
                        isEditingName = true // Show input box
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.pink.opacity(0.5))
                }
                
            

                // Tenant List
                List {
                    Text("Tenants")
                        .font(.headline)
                        .padding(.top)
                    ForEach(house.users) { user in
                        HStack {
                            Text(user.name)
                            Spacer()
                            Button("Remove") {
                                house.removeUser(user: user)
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
                
                // Add New Tenant
                HStack {
                    TextField("Tenant Name", text: $newTenantName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Tenant Email", text: $newTenantEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") {
                        if !newTenantName.isEmpty && !newTenantEmail.isEmpty {
                            house.addUser(name: newTenantName, email: newTenantEmail)
                            newTenantName = ""
                            newTenantEmail = ""
                        }
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                
            }
            .navigationTitle(house.getName()) // House name as title
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
