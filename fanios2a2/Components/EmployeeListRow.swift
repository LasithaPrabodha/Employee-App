//
//  EmployeeListRow.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct EmployeeListRow: View {
    let emp: Employee
    var body: some View {
        HStack{
            if let photoURL = emp.photo_url_small {
                EmployeeCacheImage(imageLink: photoURL)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person")
            }
            
            VStack(alignment: .leading){
                Text(emp.full_name)
                Text(emp.team)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, 6)
                 
        }
    }
}
