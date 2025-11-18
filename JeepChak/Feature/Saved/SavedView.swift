//
//  SavedView.swift
//  JeepChak
//

import SwiftUI

struct SavedView: View {
    @StateObject private var viewModel = SavedViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var showAddView = false
    @State private var showAILoading = false
    @State private var showAIResult = false
    @State private var selectedProperty: SavedProperty?
    
    var onPropertySelected: ((SavedProperty) -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            // 헤더
            SavedHeaderView(
                onBackTapped: { dismiss() },
                onAddTapped: { showAddView = true }
            )
            
            // 내용
            if viewModel.isLoading {
                loadingView
            } else if let error = viewModel.errorMessage {
                errorView(message: error)
            } else if viewModel.properties.isEmpty {
                emptyStateView
            } else {
                propertyListView
            }
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .sheet(isPresented: $showAddView) {
            AddCheckListView(
                addCheckListItem: { newItem in
                    let saved = SavedProperty(
                        propertyId: Int.random(in: 1000...9999),
                        image: newItem.image,
                        type: newItem.propertyType,
                        name: newItem.title,
                        details: newItem.address,
                        description: newItem.memo,
                        price: newItem.unit,
                        createdAt: newItem.date
                    )
                    
                    // 로컬에 추가
                    viewModel.properties.append(saved)
                    selectedProperty = saved
                    showAddView = false
                    
                    // AI 로딩 시작
                    showAILoading = true
                },
                onDismiss: {
                    showAddView = false
                }
            )
        }
        .sheet(isPresented: $showAILoading) {
            AILoadingView {
                showAILoading = false
                showAIResult = true
            }
        }
        .sheet(isPresented: $showAIResult) {
            AIGeneratedListView(onConfirm: {
                showAIResult = false
                
                // 체크리스트에 추가
                if let property = selectedProperty {
                    onPropertySelected?(property)
                    dismiss()
                }
            })
        }
    }
    
    // 매물 리스트 뷰
    private var propertyListView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(viewModel.properties) { property in
                    SavedPropertyCard(property: property)
                        .padding(.horizontal, 20)
                        .onTapGesture {
                            // 매물 선택 시
                            selectedProperty = property
                            showAILoading = true
                        }
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 100)
        }
    }
    
    // 로딩 뷰
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .scaleEffect(1.5)
            Text("매물 목록을 불러오는 중...")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top, 16)
            Spacer()
        }
    }
    
    // 에러 뷰
    private func errorView(message: String) -> some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.red.opacity(0.6))
            
            Text("매물을 불러올 수 없습니다")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text(message)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button(action: {
                viewModel.fetchProperties()
            }) {
                Text("다시 시도")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color.cyan)
                    .cornerRadius(8)
            }
            .padding(.top, 8)
            
            Spacer()
        }
    }
    
    // 빈 상태 뷰
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Text("관심 매물이 없습니다.")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
            
            Text("직접 추가 버튼을 눌러 매물을 추가해보세요!")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Button(action: {
                showAddView = true
            }) {
                Text("직접 추가")
                    .font(.system(size: 14))
                    .foregroundColor(.cyan)
                Image(systemName: "plus")
                    .font(.system(size: 12))
                    .foregroundColor(.cyan)
            }
            .padding(.top, 8)
            
            Spacer()
        }
    }
}

#Preview("빈 상태") {
    NavigationView {
        SavedView()
    }
}
