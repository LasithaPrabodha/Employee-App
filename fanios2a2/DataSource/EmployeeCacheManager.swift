//
//  EmployeeCacheManager.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

class EmployeeCacheManager {
    static let shared = EmployeeCacheManager()
    
    private var cachedEmployees: [Employee]?
    
    func fetchEmployees() -> [Employee]? {
        return cachedEmployees
    }
    
    func cacheEmployees(_ employees: [Employee]) {
        cachedEmployees = employees
    }
}
