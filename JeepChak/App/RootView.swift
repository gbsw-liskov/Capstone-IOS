//
//  RootView.swift
//  JeepChak
//
//  Created by 김은찬 on 10/18/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var appState = AppState()

    init() {
        UITabBar.appearance().tintColor = UIColor(Color.customBlue)
    }

    var body: some View {
        Group {
            if appState.isLoggedIn {
                MainTabView()
                    .environmentObject(appState)
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}

#Preview {
    RootView()
}

