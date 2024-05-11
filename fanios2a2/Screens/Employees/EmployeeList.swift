//
//  EmployeeList.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct EmployeeList: View {
    @StateObject var viewModel = EmployeeViewModel()
    
    var body: some View {
        if let error = viewModel.errorType, error != .cancelled {
            VStack{
                Text("Error: \(errorMessage(for: error))")
                    .foregroundColor(.red)
                
                Button("Refresh") {
                    Task{ await viewModel.fetchEmployees()}
                }
                .buttonStyle(.bordered)
            }
        } else {
            NavigationStack{
                ZStack {
                    
                    List (viewModel.filteredEmployees(), id: \.uuid) { emp in
                        NavigationLink(destination:  EmployeeDetails(emp)){
                            EmployeeListRow(emp: emp)
                        }
                    }
                    .overlay(Group {
                        if viewModel.filteredEmployees().isEmpty && viewModel.loadingState == .loaded {
                            Text("Oops, looks like there's no one working...")
                                .font(.subheadline)
                        }
                    })
                    .navigationTitle("Our Team")
                    .refreshable {
                        await viewModel.fetchEmployees()
                    }
                    .task {
                        await viewModel.fetchEmployees()
                    }
                    
                    
                    if viewModel.loadingState == .loading { LoadingView() }
                    
                }
                .animation(.default, value: viewModel.loadingState == .loading)
            }
            .searchable(text: $viewModel.searchTerm, prompt: "Search for team members")
            
        }
    }
    
    private func errorMessage(for error: ViewModelError?) -> String {
        guard let error = error else {
            return ""
        }
        switch error {
        case .invalidResponse:
            return "Invalid response"
        case .invalidURL:
            return "Invalid URL"
        case .unknown:
            return "An unknown error occurred"
        case .cancelled:
            return "Request cancelled"
        }
    }
}

#Preview {
    EmployeeList()
}

