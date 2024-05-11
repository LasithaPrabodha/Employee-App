//
//  NetworkingProtocol.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

protocol NetworkingProtocol {
    func request<T: Decodable>(_ url: URL) async throws -> T
}
