//
//  LanguageDropDown.swift
//  iosApp
//
//  Created by Alain Paluku on 19/05/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct LanguageDropDown: View {
    let language: UiLanguage
    let isOpen: Bool
    let selectLanguage: (UiLanguage) -> Void
    
    
    var body: some View {
        Menu {
            VStack {
                ForEach(UiLanguage.Companion().allLanguages, id: \.self.language.langCode) { language in
                    LanguageDropDownItem(language: language) {
                        selectLanguage(language)
                    }
                }
            }
        } label: {
            HStack {
                SmallLanguageIcon(language: language)
                Text(language.language.langName)
                    .foregroundColor(.lightBlue)
                Image(systemName: isOpen ? "chevron.up" : "chevron.down")
                    .foregroundColor(.lightBlue)
            }
        }

    }
}

struct LanguageDropDown_Previews: PreviewProvider {
    static var previews: some View {
        LanguageDropDown(
            language: UiLanguage(language: .french, imageName: "french"),  isOpen: true
        ) { language in
                
        }
    }
}
