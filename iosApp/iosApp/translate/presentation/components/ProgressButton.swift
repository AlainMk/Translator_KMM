//
//  ProgressButton.swift
//  iosApp
//
//  Created by Alain Paluku on 19/05/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct ProgressButton: View {
    let text: String
    let isLoading: Bool
    let onClick: () -> Void
    
    var body: some View {
        Button(
            action: {
                if !isLoading {
                    onClick()
                }
            }
        ) {
            if isLoading {
                ProgressView()
                    .animation(.easeInOut, value: isLoading)
                    .padding(5)
                    .background(Color.primaryColor)
                    .cornerRadius(100)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text(text.uppercased())
                    .animation(.easeInOut, value: isLoading)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .font(.body.weight(.bold))
                    .background(Color.primaryColor)
                    .foregroundColor(Color.onPrimary)
                    .cornerRadius(100)
            }
        }
    }
}

struct ProgressButton_Previews: PreviewProvider {
    static var previews: some View {
        ProgressButton(
            text: "Translate",
            isLoading: false,
            onClick: {}
        )
    }
}
