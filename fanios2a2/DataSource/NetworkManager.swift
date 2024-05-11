//
//  NetworkManager.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

public final class Networking: NetworkingProtocol {
    public func request<T: Decodable>(_ url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.responseUnsuccessful }

        switch httpResponse.statusCode {
        case 200...299:
            let responseObject = try JSONDecoder().decode(T.self, from: data)
            return responseObject
        case 400...499:
            let responseObject = try JSONDecoder().decode(ErrorResponse.self, from: data)
            throw NetworkError.notFound(responseObject.error.message)
        case 500...599:
            throw NetworkError.badRequest
        default:
            throw NetworkError.unknownError
        }
    }
}
