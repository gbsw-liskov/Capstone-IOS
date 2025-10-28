//
//  HomeView.swift
//  Eodigo
//
//  Created by 김은찬 on 9/8/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "home.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                Text("홈")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
                Text("홈 페이지입니다")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                Spacer()
            }
            .padding(.bottom, 80)
            .navigationTitle("홈")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
