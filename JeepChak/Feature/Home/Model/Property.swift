//
//  Property.swift
//  JeepChak
//
//  Created by 김은찬 on 10/29/25.
//

import Foundation
import SwiftUI

struct Property: Identifiable, Hashable {
    let id = UUID()
    let address: String
    let location: String
    let price: String
    let type: String
    let area: String
    let imageName: String
    let detail: String
}
