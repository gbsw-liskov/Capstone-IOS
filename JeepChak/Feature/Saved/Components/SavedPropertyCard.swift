//
//  SavedPropertyCard.swift
//  JeepChak
//
//  Created by 김은찬 on 11/15/25.
//

import SwiftUI

struct SavedPropertyCard: View {
    let property: SavedProperty
    
    var body: some View {
        HStack(spacing: 12) {
            // 이미지
            if let image = property.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                    .clipped()
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            }
            
            // 정보
            VStack(alignment: .leading, spacing: 8) {
                Text(property.type)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Text(property.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text(property.details)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text(property.description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(property.price)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical, 4)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}
