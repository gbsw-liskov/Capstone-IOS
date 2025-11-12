//
//  SignUpView.swift
//  Eodigo
//
//  Created by 김은찬 on 11/9/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                AuthHeaderView(onBackTapped: {
                    dismiss()
                })
                .padding(.bottom, 30)
                
                VStack(spacing: 40) {
                    titleSection
                    signUpFormSection
                    signUpButton
                    loginLink
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.customWhite.ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}



// MARK: - UI
extension SignUpView {
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("회원가입")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var signUpFormSection: some View {
        VStack(spacing: 20) {
            CustomTextField(placeholder: "이름", text: $viewModel.name)
            CustomTextField(placeholder: "전화번호", text: $viewModel.phoneNumber)
            CustomTextField(placeholder: "아이디", text: $viewModel.userId)
            CustomSecureField(placeholder: "비밀번호", text: $viewModel.password, isSecure: $viewModel.isPasswordSecure)
                CustomSecureField(placeholder: "비밀번호 확인", text: $viewModel.passwordConfirm, isSecure: $viewModel.isConfirmSecure)
            }
        .foregroundColor(Color.customBlack)
        }
    
    private var signUpButton: some View {
        Button(action: viewModel.signUp) {
            Text("회원가입")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(viewModel.isSignUpEnabled ? .black : .gray)
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isSignUpEnabled ? Color(UIColor.customBlack) : Color(UIColor.customGray100))
                .cornerRadius(12)
        }
        .disabled(!viewModel.isSignUpEnabled)
        .padding(.top, 10)
    }
    
    private var loginLink: some View {
        NavigationLink(destination: LoginView()) {
            Text("로그인")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .underline()
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    SignUpView()
}
