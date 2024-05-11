//
//  EmployeeDetails.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct EmployeeDetails: View {
    let employee: Employee
    init(_ employee: Employee) {
        self.employee = employee
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            ScrollView(.vertical){
                LazyVStack(alignment: .leading, spacing: 12){
                    EmployeeHeader(team: employee.team, 
                                   employee_type: employee.employee_type.toString(),
                                   name: employee.full_name,
                                   imageUrl: employee.photo_url_large)
                    
                    VStack(alignment: .leading){
                        if let bio = employee.biography  {
                            Text(bio)
                                .padding(.bottom, 12)
                        }
                        
                        
                        if let phone_number = employee.phone_number  {
                            Label(
                                title: { Text(phone_number) },
                                icon: { Image(systemName: "phone").foregroundStyle(.accent) }
                            ).padding(.bottom, 6)
                        }
                        
                        Label(
                            title: { Text(employee.email_address) },
                            icon: { Image(systemName: "envelope").foregroundStyle(.accent) }
                        ).padding(.bottom, 6)
                        
                        
                        
                    }
                    .padding()
                }
                
                
                
            }
            .scrollIndicators(.hidden)
            
            ZStack{
                Image(systemName: "chevron.left")
                    .padding(10)
                    .background(.gray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    EmployeeDetails(Employee.mock)
}
