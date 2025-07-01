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
    }
}

#Preview {
    ManufacturingCompaniesDetailsView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", image: URL(string: "https://example.com/kellanova.png"), summary: "short description", phone: "", focus: ""))
}
