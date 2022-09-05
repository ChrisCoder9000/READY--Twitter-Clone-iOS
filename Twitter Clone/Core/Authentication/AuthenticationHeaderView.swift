//
//  AuthenticationHeaderView.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 05/09/22.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text(title1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(title2)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
        }
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(title1: "Hello.", title2: "Welcome back")
            .previewLayout(.sizeThatFits)
    }
}
