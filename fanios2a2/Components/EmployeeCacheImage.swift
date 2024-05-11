//
//  CacheAsyncImage.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI


struct EmployeeCacheImage:View {
    var imageLink:String?
    var body: some View{
        CacheAsyncImage(
            imageLink: imageLink
        ) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure(let error):
                ErrorView(error: error)
            case .empty:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                
            @unknown default:
                // AsyncImagePhase is not marked as @frozen.
                // We need to support new cases in the future.
                Image(systemName: "questionmark")
            }
        }
    }
}

