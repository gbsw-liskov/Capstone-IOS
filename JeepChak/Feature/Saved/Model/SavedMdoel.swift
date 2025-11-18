//
//  SavedModel.swift
//  JeepChak
//
//  Created by 김은찬 on 11/15/25.
//

import SwiftUI

struct SavedProperty: Identifiable {
    let id = UUID()
    let propertyId: Int
    var image: UIImage?
    let type: String
    let name: String
    let details: String
    let description: String
    let price: String
    let createdAt: String
    
    // API Response → SavedProperty 변환
    static func from(_ response: PropertyListResponse) -> SavedProperty {
        return SavedProperty(
            propertyId: response.propertyId,
            image: nil, // 썸네일은 별도 로드 필요
            type: "매물", // 기본값
            name: response.name,
            details: response.address,
            description: "",
            price: "",
            createdAt: response.createdAt
        )
    }
}

