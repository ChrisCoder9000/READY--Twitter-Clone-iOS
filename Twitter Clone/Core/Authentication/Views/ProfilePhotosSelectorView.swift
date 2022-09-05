//
//  ProfilePhotosSelectorView.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 05/09/22.
//

import SwiftUI

struct ProfilePhotosSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                VStack {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .frame(width: 240, height: 240)
                            .clipShape(Circle())
                            .modifier(ProfileImageModifier())
                        
                    } else {
                        VStack {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding(.horizontal)
                                .padding(.top)
                                .padding(.bottom, 4)
                            Text("Photo")
                                .font(.title)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                        .frame(width: 140, height: 140)
                        .padding(40)
                        .overlay(Circle().stroke(Color(.systemBlue), lineWidth: 1.5))
                    }
                }
            }
            .padding(.top, 44)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .scaledToFit()
    }
}

struct ProfilePhotosSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotosSelectorView()
    }
}
