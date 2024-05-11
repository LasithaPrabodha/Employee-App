//
//  Settings.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct Settings: View {
    let viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Student information")) {
                    ForEach(viewModel.items, id: \.self){ item in
                        Text(item)
                    }
                }
                
            }
            .navigationBarTitle(Text("Settings"))
            
            
        }
    }
}

#Preview {
    Settings()
}
