//
//  ManufacturingDetailsView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/25/25.
//

import SwiftUI

struct ManufacturingCompaniesDetailsView: View {
    
    var company: Company
    
    var body: some View {
        Text(company.name)
            .bold()
        Divider()
        Text(company.description)
        Divider()
        Text(company.email)
        Divider()
        Text(company.location)
        Divider()
        Text(company.summary)
        Divider()
        Text(company.phone)
        Divider()
        Text(company.focus)
        Divider()
    }
}

#Preview {
    ManufacturingCompaniesDetailsView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", image: URL(string: "https://example.com/kellanova.png"), summary: "short description", phone: "", focus: ""))
}
