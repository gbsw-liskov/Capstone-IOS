//
//  ChecklistService.swift
//  JeepChak
//
//  Created by 김은찬 on 11/15/25.
//

import Foundation
import Combine
import Moya
import CombineMoya

final class ChecklistService {
    private let provider = MoyaProvider<ChecklistAPI>(plugins: [NetworkLoggerPlugin()])
    
    // 기존 메서드 이름 변경
    func uploadChecklist(request: ChecklistRequest) -> AnyPublisher<ChecklistResponse, Error> {
        return provider.requestPublisher(.createChecklist(request: request))
            .filterSuccessfulStatusCodes()
            .map(ChecklistResponse.self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // 체크리스트 자동 생성
    func generateChecklist(propertyId: Int) -> AnyPublisher<[GeneratedChecklistResponse], Error> {
        return provider.requestPublisher(.generateChecklist(propertyId: propertyId))
            .filterSuccessfulStatusCodes()
            .map([GeneratedChecklistResponse].self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
