//
//  NetworkError.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonDecodingError
    case notFound(String)
    case badRequest
    case unknownError
    case invalidRequest
}

