//
//  ContentView.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView{
            EmployeeList()
                .tabItem {
                    Label("Our Team", systemImage: "person.3")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
