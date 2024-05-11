//
//  CacheAsyncImage.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI


struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL?
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        imageLink: String?,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    )  {
        if let photoURL = imageLink, let url = URL(string: photoURL) {
            self.url = url
        } else{
            self.url = nil
        }
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let u = url {
            if let cached = ImageCache[u] {
                let _ = print("cached \(u.absoluteString)")
                content(.success(cached))
            } else {
                let _ = print("request \(u.absoluteString)")
                AsyncImage(
                    url: url,
                    transaction: transaction
                ) { phase in
                    cacheAndRender(phase: phase, url: u)
                }
            }
        } else{
            ErrorView(error: ServiceError.invalidURL)
        }
    }
    
    func cacheAndRender(phase: AsyncImagePhase, url: URL) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(
            imageLink:  Employee.mock.photo_url_small!
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
            case .failure(let error):
                ErrorView(error: error)
            @unknown default:
                fatalError()
            }
        }
    }
}


fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]
    static private let maxCacheSize = 100
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            // Remove the oldest item if the cache size exceeds the maximum
            while ImageCache.cache.count >= maxCacheSize {
                if let key = ImageCache.cache.keys.first {
                    ImageCache.cache.removeValue(forKey: key)
                }
            }
            ImageCache.cache[url] = newValue
        }
    }
}
