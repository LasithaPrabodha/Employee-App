//
//  EmployeeService.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

final class EmployeeService: EmployeeServiceProtocol{
    let employeeURL: String = "\(API.BASE_URL)\(API.EMPLOYEES)"
    let networking = Networking()
    static let shared = EmployeeService()
    
    func fetchEmployees() async throws -> [Employee] {
        guard let url = URL(string: employeeURL) else {
            throw ServiceError.invalidURL
        }
        
        do {
            let result = try await networking.request(url) as EmployeeResponse
            return result.employees
        } catch {
            if let urlError = error as? URLError, urlError.code == URLError.cancelled {
                print("Request cancelled")
                throw ServiceError.requestCancelled
            } else {
                print(error)
                throw ServiceError.otherError(error.localizedDescription)
            }
            
        }
    }
}
