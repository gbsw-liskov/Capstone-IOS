//
//  PropertyCard.swift
//  JeepChak
//
//  Created by 김은찬 on 10/30/25.
//

import SwiftUI

struct PropertyCard: View {
    let property: Property

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topTrailing) {
                // 이미지
                Image(property.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 161, height: 161)
                    .cornerRadius(5)
                    .clipped()
                
                // 좋아요
                Button(action: {}) {
                    Image("Home_heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 14)
                }
                .padding(14)
            }

            // 매물 정보
            VStack(alignment: .leading, spacing: 6) {
                Text(property.price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.customBlack)
                    .padding(.top, 8)
                
                Text("\(property.type)  \(property.area)")
                    .font(.system(size: 12))
                    .foregroundColor(.customDarkGray)
                
                Text(property.address)
                    .font(.system(size: 12))
                    .foregroundColor(.customDarkGray)
                
                Text(property.detail)
                    .font(.system(size: 10))
                    .foregroundColor(.customDarkGray)
                    
            }
        }
        .frame(width: 160)
    }
}

#Preview {
    PropertyCard(
        property: Property(
            address: "의성군 봉양면 화전리 129 파랑채",
            location: "봉양면",
            price: "월세 120",
            type: "원룸",
            area: "1층 15평",
            imageName: "Home_img1",
            detail: "깨끗하게 관리되어 있습니다."
        )
    )
}
