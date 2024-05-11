//
//  ServiceError.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

public enum ServiceError: Error {
    case invalidURL
    case invalidData
    case otherError(String)
    case requestCancelled
}
