//
//  EmployeeServiceProtocal.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation


protocol EmployeeServiceProtocol : AnyObject {
    func fetchEmployees() async throws -> [Employee]
}
