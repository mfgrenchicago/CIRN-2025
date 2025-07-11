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
		GroupBox {
		VStack(alignment: .leading, spacing: 5) {
			
			Text(company.displayName?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
				.font(.title3)
				.fontWeight(.semibold)
				.lineLimit(2)
			
			VStack(alignment: .leading) {
				RatingView(rating: .constant(company.reviewRating))
				
				Text("\(company.reviews?.count ?? 0) reviews")
					.foregroundStyle(.tertiary)
					.font(.caption)
			}
			.padding(.bottom)
			
			// Some companies do not have a summary
			if let summary = company.editorialSummary?.text {
				Text(summary)
			}
			
			Text(company.shortFormattedAddress)
				.font(.subheadline)
				.foregroundStyle(.secondary)
			
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		
	}
	}
}

//#Preview {
//    ManufacturingCompanyRowView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", image: URL(string: "https://example.com/kellanova.png"), summary: "short description", phone: "", focus: ""))
//}
