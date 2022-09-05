//
//  SideMenuView.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 05/09/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authVm: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { vM in
                if vM == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: vM)
                    }
                } else if vM == .logout {
                    Button {
                        authVm.signOut()
                    } label: {
                        SideMenuOptionRowView(viewModel: vM)
                    }

                } else {
                    SideMenuOptionRowView(viewModel: vM)
                }
            }
            
            Spacer()
        }
        .background(.white)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
