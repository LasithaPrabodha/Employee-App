//
//  LoaderView.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Material.thick)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                Text("Loading...")
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 200, height: 200)
            }
            .offset(y: -70)
            
        }
    }
}
