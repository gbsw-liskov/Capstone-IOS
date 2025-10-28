//
//  MyView.swift
//  Eodigo
//
//  Created by 김은찬 on 10/4/25.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "user.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                Text("마이")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
                Text("마이 페이지입니다")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                Spacer()
            }
            .padding(.bottom, 80)
            .navigationTitle("마이")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MyView()
}
