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
        NavigationStack {
            VStack(alignment: .leading){
                Text(company.displayName?.text ?? "")
                    .bold()
                Text(company.shortFormattedAddress)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text(company.nationalPhoneNumber ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                // mock description
                Text("Chicago's trusted partner for durable, custom-made manufacturing solutions. Delivering excellence to industries nationwide for over a decade.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}
