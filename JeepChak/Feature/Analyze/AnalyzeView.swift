//
//  NFTView.swift
//  Eodigo
//
//  Created by 김은찬 on 10/4/25.
//

import SwiftUI

struct AnalyzeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "home.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                Text("매물 분석")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
                Text("매물분석 페이지입니다")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                Spacer()
            }
            .padding(.bottom, 80)
            .navigationTitle("매물 분석")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AnalyzeView()
}
