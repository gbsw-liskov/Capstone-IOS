//
//  PropertyAPI.swift
//  JeepChak
//
//  Created by 김은찬 on 11/15/25.
//

import Foundation
import Moya
internal import Alamofire

enum PropertyAPI {
    case getProperties
    case getPropertyDetail(id: Int)
    case createProperty(request: PropertyRequest)
    case deleteProperty(id: Int)
}

extension PropertyAPI: TargetType {
    
    var baseURL: URL {
        URL(string: "http://ai.zipchak-backend.kro.kr")!   // 백엔드 도메인
    }
    
    var path: String {
        switch self {
        case .getProperties:
            return "/api/properties"
        case .getPropertyDetail(let id):
            return "/api/properties/\(id)"
        case .createProperty:
            return "/api/property"
        case .deleteProperty(let id):
            return "/api/property/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProperties, .getPropertyDetail:
            return .get
        case .createProperty:
            return .post
        case .deleteProperty:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .getProperties, .getPropertyDetail, .deleteProperty:
            return .requestPlain

        case .createProperty(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
