//
//  ManufacturingDetailsView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/25/25.
//

import SwiftUI
import MapKit

struct ManufacturingCompaniesDetailsView: View {
    
    var company: Company
    
    var body: some View {
        VStack(spacing: 16) {
            Map()
                .frame(width: 300, height: 300)
                .cornerRadius(10)
            Text(company.focus)
                .font(.headline)
            Link(destination: URL(string: "https://www.kellanova.com/us/en/home.html")!) {
                Label("Visit Website", systemImage: "globe")
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(company.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "phone")
                }
            }
        }
    }
}
#Preview {
    ManufacturingCompaniesDetailsView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", image: URL(string: "https://example.com/kellanova.png"), summary: "short description", phone: "223", focus: "life, eating, and something"))
}
