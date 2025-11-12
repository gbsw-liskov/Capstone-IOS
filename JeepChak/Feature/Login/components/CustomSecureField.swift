//
//  CustomSecureField.swift
//  JeepChak
//
//  Created by 김은찬 on 11/9/25.
//

import SwiftUI

struct CustomSecureField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(placeholder)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                if isSecure {
                    SecureField("", text: $text)
                        .font(.system(size: 16))
                } else {
                    TextField("", text: $text)
                        .font(.system(size: 16))
                }
                
                Button(action: {
                    isSecure.toggle()
                }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 4)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(UIColor.customGray100))
        }
    }
}
