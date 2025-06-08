//
//  PasswordRequirementsChecklist.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 08/06/25.
//

import SwiftUI

struct PasswordRequirementsChecklist: View {
    let metRequirements: Set<Validator.PasswordRequirement>
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Validator.PasswordRequirement.allCases) { requirement in
                let isMet = self.metRequirements.contains(requirement) // O(1)
                let labelImage = isMet ? "checkmark.circle.fill" : "xmark.circle.fill"
                let labelColor = isMet ? Color.green : Color.red
                
                Label(requirement.rawValue, systemImage: labelImage)
                    .foregroundStyle(labelColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
