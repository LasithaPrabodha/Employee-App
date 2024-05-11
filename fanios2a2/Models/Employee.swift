//
//  Employee.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

struct Employee: Codable, Hashable {
    let uuid: UUID;
    let full_name: String;
    let phone_number:String?;
    let email_address: String;
    let biography: String?;
    let photo_url_small:String?;
    let photo_url_large: String?;
    let team: String;
    let employee_type:EmployeeType;
}

 
struct EmployeeResponse: Codable {
    let employees: [Employee]
}
