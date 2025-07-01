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
    ManufacturingCompanyRowView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", Image: URL(string: "https://example.com/kellanova.png"), Summary: "short description", phone: "", focus: ""))
}
