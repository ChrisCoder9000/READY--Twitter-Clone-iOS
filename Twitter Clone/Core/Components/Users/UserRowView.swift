//
//  UserRowView.swift
//  Twitter Clone
//
//  Created by Christian Nonis on 05/09/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text("joker")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text("Health Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}


struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
            .previewLayout(.sizeThatFits)
    }
}
