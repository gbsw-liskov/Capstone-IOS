//
//  SavedViewModel.swift
//  JeepChak
//
//  Created by 김은찬 on 11/15/25.
//

import SwiftUI
import Foundation
import Combine

class SavedViewModel: ObservableObject {
    @Published var properties: [SavedProperty] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let propertyService = PropertyService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchProperties()
    }
    
    func fetchProperties() {
        isLoading = true
        errorMessage = nil
        
        propertyService.getProperties()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                
                switch completion {
                case .finished:
                    print("매물 목록 조회 완료")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("매물 목록 조회 실패:", error.localizedDescription)
                }
            } receiveValue: { [weak self] responses in
                guard let self = self else { return }
                self.properties = responses.map { SavedProperty.from($0) }
                print("조회된 매물 개수:", self.properties.count)
            }
            .store(in: &cancellables)
    }
    
    func deleteProperty(id: Int) {
        propertyService.deleteProperty(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("매물 삭제 완료")
                case .failure(let error):
                    print("매물 삭제 실패:", error.localizedDescription)
                }
            } receiveValue: { [weak self] _ in
                self?.fetchProperties()
            }
            .store(in: &cancellables)
    }
}
