//
//  EmployeeHeader.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct EmployeeHeader: View {
    var team: String
    var employee_type: String
    var name: String
    var imageUrl:String?
    var shadowColor: Color = .black.opacity(0.8)
    
    @State
    private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        EmployeeCacheImage(imageLink: imageUrl)
            .stretchy()
            .overlay(
                VStack(alignment: .leading, spacing: 8){
                    Text(team)
                        .font(.headline)
                    HStack{
                        Text(name)
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(employee_type)
                            .padding(.horizontal, 6)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.accent, lineWidth: 2))
                            .padding(.leading, 12)
                        
                    }
                }
                    .foregroundStyle(.white)
                    .padding(16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .background(LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)),
                alignment: .bottomLeading
            )
            .frame(height: 300)
    }
}

#Preview {
    ZStack{
        Color.white.ignoresSafeArea()
        ScrollView{
            EmployeeHeader(
                team: Employee.mock.team, 
                employee_type: Employee.mock.employee_type.toString(),
                name: Employee.mock.full_name,
                imageUrl: Employee.mock.photo_url_large
            )
        }
    }
}
