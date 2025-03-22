
//  UserView.swift
//  Household Management
//
//  Created by James Sheppard on 16/02/2025.
//  Edited by Ellie Deaner 18/02/25.


import SwiftUI
import UIKit

struct UserView: View {
    @EnvironmentObject var currentUser: UserViewModel
    @State private var isEditing = false
    @State private var editedName = ""
    @State private var editedHouse = ""
    @State private var editedEmail = ""
    @State private var profileImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isChoresSelected = true
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(uiImage: profileImage ?? UIImage(systemName: "person.circle.fill")!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                    .onTapGesture {
                        isImagePickerPresented.toggle()
                    }
                
                VStack(alignment: .leading) {
                    Text(currentUser.user.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Email: \(currentUser.user.email)")
                        .foregroundColor(.gray)
                    
                    Text("Address: \(currentUser.user.house)")
                }
                Spacer()
            }
            .padding()
            
          
            Button(action: {
                isEditing.toggle()
                editedName = currentUser.user.name
                editedHouse = currentUser.user.house
                editedEmail = currentUser.user.email
            }) {
                Text("Edit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 1.0, green: 0.75, blue: 0.8))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
         
            if isEditing {
                ScrollView{
                    VStack {
                        TextField("Name", text: $editedName)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Address", text: $editedHouse)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Email", text: $editedEmail)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        
                        Button(action: {
                            currentUser.user.name = editedName
                            currentUser.user.house = editedHouse
                            currentUser.user.email = editedEmail
                            isEditing = false
                        }) {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top)
                        
                        Button(action: {
                            isEditing = false
                        }) {
                            Text("Cancel")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top)
                    }
                    .padding()
                }
            }
            
            
            if !isEditing{
                HStack {
                    Button(action: {
                        isChoresSelected = true
                    }) {
                        Text("Chores")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                            .background(isChoresSelected ? Color(red: 1.0, green: 0.75, blue: 0.8) : Color.clear)
                            .foregroundColor(isChoresSelected ? .white : Color(red: 1.0, green: 0.75, blue: 0.8))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        isChoresSelected = false
                    }) {
                        Text("Payments")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)  // Reduced vertical padding
                            .background(!isChoresSelected ? Color(red: 1.0, green: 0.75, blue: 0.8) : Color.clear)
                            .foregroundColor(!isChoresSelected ? .white : Color(red: 1.0, green: 0.75, blue: 0.8))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
                .background(Color.white)
                .cornerRadius(8)
                
                if isChoresSelected {
                    VStack {
                        List {
                            Text("No chores")
                        }
                        .frame(maxHeight: 200)
                    }
                } else {
                    VStack {
                        List {
                            Text("No payments")
                        }
                        .frame(maxHeight: 200)
                    }
                }
            }
            Spacer()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $profileImage)
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.editedImage] as? UIImage {
                parent.image = selectedImage
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
