//
//  ErrorResponse.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

struct ErrorResponse : Decodable{
    struct Error : Decodable{
        let code: Int
        let message: String
    }
    let error: Error
}
