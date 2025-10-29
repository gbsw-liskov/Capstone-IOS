//
//  HomePopularSectionView.swift
//  JeepChak
//
//  Created by 김은찬 on 10/29/25.
//

import SwiftUI

struct HomePopularSectionView: View {
    let properties: [Property]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 8) {
                Image("Home_fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .symbolRenderingMode(.multicolor)
                Text("지금 가장 인기있는 봉양면 매물")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(properties) { property in
                    PropertyCard(property: property)
                }
            }
        }
    }
}


