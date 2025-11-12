//
//  LoginViewModel.swift
//  Eodigo
//
//  Created by 김은찬 on 9/8/25.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    // 입력
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var isPasswordSecure: Bool = true
    @Published var autoLogin: Bool = false
    
    // 출력
    @Published var isLoginEnabled: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        // 입력 값 감시 → 로그인 버튼 활성화 여부 자동 업데이트
        $userId
            .combineLatest($password)
            .map { !$0.isEmpty && !$1.isEmpty }
            .assign(to: &$isLoginEnabled)
    }
    
    // MARK: - Apple 로그인
    func signInWithApple() {
        // TODO: - 실제 Apple 로그인 연동
        print("Apple 로그인 시도")
    }
    
    // MARK: - 로그인
    func login() {
        guard isLoginEnabled else { return }
        
        if userId == "test" && password == "1234" {
            // 로그인 성공
            isLoggedIn = true
            print("로그인 성공")
            
            // 자동 로그인 설정 저장
            if autoLogin {
                UserDefaults.standard.set(true, forKey: "autoLogin")
                UserDefaults.standard.set(userId, forKey: "savedUserId")
            }
        } else {
            // 로그인 실패
            showErrorAlert = true
            errorMessage = "아이디 또는 비밀번호가 올바르지 않습니다."
        }
    }
    
    // MARK: - 자동 로그인 상태 로드
    func loadAutoLogin() {
        let savedAutoLogin = UserDefaults.standard.bool(forKey: "autoLogin")
        if savedAutoLogin {
            userId = UserDefaults.standard.string(forKey: "savedUserId") ?? ""
            autoLogin = true
        }
    }
    
    // MARK: - 로그아웃
    func logout() {
        isLoggedIn = false
        autoLogin = false
        UserDefaults.standard.removeObject(forKey: "autoLogin")
        UserDefaults.standard.removeObject(forKey: "savedUserId")
    }
}
