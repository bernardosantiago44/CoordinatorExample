//
//  RoundedTextFieldStyle.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    private let _Label: Label<Text, Image>?
    
    init(headerText: LocalizedStringKey? = nil, systemImage: String = "") {
        if let headerText {
            self._Label = Label(headerText, systemImage: systemImage)
        } else {
            self._Label = nil
        }
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if let _Label = self._Label {
                _Label
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            configuration
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color(uiColor: .secondarySystemBackground))
                )
        }
    }
}
