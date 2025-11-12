//
//  AppState.swift
//  JeepChak
//
//  Created by 김은찬 on 11/9/25.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    init() {
        let autoLogin = UserDefaults.standard.bool(forKey: "autoLogin")
        let savedUser = UserDefaults.standard.string(forKey: "savedUserId") ?? ""
        isLoggedIn = autoLogin && !savedUser.isEmpty
    }
    
    func login(userId: String) {
        UserDefaults.standard.set(true, forKey: "autoLogin")
        UserDefaults.standard.set(userId, forKey: "savedUserId")
        isLoggedIn = true
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "autoLogin")
        UserDefaults.standard.removeObject(forKey: "savedUserId")
        isLoggedIn = false
    }
}
