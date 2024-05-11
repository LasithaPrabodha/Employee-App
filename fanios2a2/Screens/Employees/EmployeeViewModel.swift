//
//  EmployeeViewModel.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation
import Combine

enum LoadingState {
    case idle
    case loading
    case loaded
}

enum ViewModelError: Error {
    case unknown
    case invalidResponse
    case invalidURL
    case cancelled
}

@MainActor
final class EmployeeViewModel: ObservableObject  {
    @Published var searchTerm: String = ""
    @Published var employeesList: [Employee] = []
    @Published var loadingState: LoadingState = .idle
    @Published var errorType: ViewModelError?
    
    private let cacheManager = EmployeeCacheManager.shared
    private let employeeService: EmployeeServiceProtocol = EmployeeService.shared
    
    func fetchEmployees() async  {
        loadingState = .loading
        errorType = nil
        do {
            if let cachedEmployees = cacheManager.fetchEmployees() {
                employeesList = cachedEmployees
            } else {
                employeesList = try await employeeService.fetchEmployees()
                cacheManager.cacheEmployees(employeesList)
            }
        } catch ServiceError.invalidData {
            errorType = .invalidResponse
        } catch ServiceError.invalidURL {
            errorType = .invalidURL
        } catch ServiceError.requestCancelled {
            errorType = .cancelled
        } catch {
            errorType = .unknown
        }
        loadingState = .loaded
    }
    
    func filteredEmployees() -> [Employee] {
        if searchTerm.isEmpty {
            return employeesList
        } else {
            return employeesList.filter { $0.full_name.lowercased().contains(searchTerm.lowercased()) }
        }
    }
    
}
