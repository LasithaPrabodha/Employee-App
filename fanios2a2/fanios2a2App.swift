//
//  fanios2a2App.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

@main
struct fanios2a2App: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            } else {
                MainView()
            }
        }
    }
}
