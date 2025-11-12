//
//  CustomTextField.swift
//  JeepChak
//
//  Created by 김은찬 on 11/9/25.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(placeholder)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            TextField("", text: $text)
                .font(.system(size: 16))
                .padding(.vertical, 4)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(UIColor.customGray100))
        }
    }
}
