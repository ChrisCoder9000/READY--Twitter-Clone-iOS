//
//  Twitter_CloneApp.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 04/09/22.
//

import SwiftUI
import Firebase

@main
struct Twitter_CloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    
            }
            .environmentObject(viewModel)
        }
    }
}
