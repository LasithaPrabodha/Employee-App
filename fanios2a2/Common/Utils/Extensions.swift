//
//  Extensions.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import Foundation

extension EmployeeType {
    func toString() -> String {
        switch self {
        case .CONTRACTOR:
            return "Contractor"
        case .FULL_TIME:
            return "Full time"
        case .PART_TIME:
            return "Part time"
        }
    }
}

extension Employee{
    static var mock: Employee {
        Employee(
            uuid: UUID(uuidString: "0d8fcc12-4d0c-425c-8355-390b312b909c")!,
            full_name: "Justine Mason",
            phone_number: "5553280123",
            email_address: "jmason.demo@squareup.com",
            biography: "Engineer on the Point of Sale team.",
            photo_url_small: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
            photo_url_large: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",
            team: "Point of Sale",
            employee_type: .FULL_TIME
        )
    }
}
