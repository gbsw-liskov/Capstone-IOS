//
//  SignUpViewModel.swift
//  JeepChak
//
//  Created by 김은찬 on 10/29/25.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    @Published var isPasswordSecure: Bool = true
    @Published var isConfirmSecure: Bool = true
    
    var isSignUpEnabled: Bool {
        !name.isEmpty &&
        !phoneNumber.isEmpty &&
        !userId.isEmpty &&
        !password.isEmpty &&
        password == passwordConfirm
    }
    
    func signInWithApple() {
        // TODO: - Apple 로그인
        print("Apple 로그인 시도")
    }
    
    func signUp() {
        // TODO: - 회원가입 로직
        print("회원가입 완료: \(name), \(userId)")
    }
}
