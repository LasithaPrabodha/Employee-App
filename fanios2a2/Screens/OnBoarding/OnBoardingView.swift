//
//  OnBoardingView.swift
//  fanios2a2
//
//  Created by Lasitha Weligampola on 2024-04-13.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    let viewModel = OnBoardingViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(named: "fanshawe-college-logo")! )
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom)
            
            Text(viewModel.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            Spacer()
            Text(viewModel.description)
                .font(.caption)
            
            Button {
                isOnboarding = false
            } label: {
                Label("Continue", systemImage: "arrow.right")
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}

#Preview {
    OnBoardingView()
}
