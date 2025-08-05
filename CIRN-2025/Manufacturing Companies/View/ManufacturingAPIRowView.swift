//
//  ManufacturingAPIRowView.swift
//  CIRN-2025
//
//  Created by Lola Feurer on 7/16/25.
//


import SwiftUI

struct ManufacturingAPIRowView: View {
    
    let company: APICompany
    
    var body: some View {
        VStack(alignment: .leading){
            Text(company.displayName?.text ?? "")
                .bold()
                .padding(.bottom, 5)
                .accessibilityLabel(Text("Company name"))
                .accessibilityValue(Text(company.displayName?.text ?? ""))
            Text(company.shortFormattedAddress)
                .font(.footnote)
                .foregroundStyle(.primary)
                .accessibilityLabel(Text("Company address"))
                .accessibilityValue(Text(company.shortFormattedAddress))
            Text(company.nationalPhoneNumber ?? "")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .accessibilityLabel(Text("Company phone number"))
                .accessibilityValue(Text(company.nationalPhoneNumber ?? ""))
            // mock description
            Text("Chicago's trusted partner for durable, custom-made manufacturing solutions. Delivering excellence to industries nationwide for over a decade.")
                .font(.footnote)
                .foregroundStyle(.tertiary)
                .accessibilityLabel(Text("Company description"))
                .accessibilityValue(Text("Chicago's trusted partner for durable, custom-made manufacturing solutions. Delivering excellence to industries nationwide for over a decade."))
        }
    }
}
