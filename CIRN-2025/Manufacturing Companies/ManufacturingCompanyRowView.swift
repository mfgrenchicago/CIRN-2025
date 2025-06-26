//
//  ManufacturingCompRowView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/23/25.
//

import SwiftUI

struct ManufacturingCompanyRowView: View {
    
    let company: Company
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                //bolds the company name
                Text(company.name)
                    .bold()
                //changes the information into a footnote/subscript and changes the color
                Text(company.description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text(company.email)
                    .font(.footnote)
                    .foregroundColor(Color.blue)
                Text(company.location)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    ManufacturingCompanyRowView(company: Company(name: "Kellanova", description: "Snack & cereal maker, global", email: "investor.relations@kellanova.com", location: "Chicago, IL"))
}
