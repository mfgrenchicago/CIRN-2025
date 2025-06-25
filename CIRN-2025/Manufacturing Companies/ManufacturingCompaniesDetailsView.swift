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
        Text("something")
    }
}

#Preview {
    ManufacturingCompaniesDetailsView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago"))
}
