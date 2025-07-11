//
//  ManufacturingDetailsView.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/25/25.
//

import SwiftUI
import MapKit

struct ManufacturingCompaniesDetailsView: View {
	
	@StateObject var viewModel: ManufacturingDetailsViewModel
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				AsyncImage(url: viewModel.company.firstPhotoURL) { image in
					image
						.resizable()
						.scaledToFill()
						.frame(height: 300)
						.frame(width: 350)
						.clipShape(RoundedRectangle(cornerRadius: 8))
				} placeholder: {
					ProgressView(LocalizedStringKey("Loading Image..."))
						.controlSize(.large)
				}
				.padding()
				
				
				VStack(alignment: .leading, spacing: 5) {
					
					RatingView(rating: .constant(viewModel.company.reviewRating))
					
					Text(viewModel.company.displayName?.text ?? "")
						.font(.title3)
						.fontWeight(.semibold)
					
					if let googleMapsURL = viewModel.company.googleMapsUri {
						Link(LocalizedStringKey(viewModel.company.formattedAddress), destination: googleMapsURL)
					}
					
					if let reviews = viewModel.company.reviews, !reviews.isEmpty {
						DisclosureGroup("Reviews") {
							ForEach(reviews) { review in
								
								CompanyReviewView(review: review)
							}

						}
						.tint(.primary)
						.padding(.top)
						
					}
					
				}
				.padding([.horizontal])
				
				
				Spacer()
				
				if let websiteURL = viewModel.company.websiteUri {
					HStack {
						Spacer()
						
						Link(destination: websiteURL) {
							Label("Visit Website", systemImage: "globe")
								.font(.title3)
								.fontWeight(.semibold)
						}
						.buttonStyle(.borderedProminent)
						.padding()
						
						Spacer()
					}
				}
				
			}
			.navigationTitle(viewModel.company.displayName?.text ?? "")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						#if targetEnvironment(simulator)
						viewModel.showAlert.toggle()
						#else
						viewModel.makeACall()
						#endif
						
					}) {
						Image(systemName: "phone")
					}
				}
			}
		}
		.alert(isPresented: $viewModel.showAlert) {
			Alert(title: Text("To test phone calls, you need to run on a real physical device, not the simulator 😊"))
		}
	}
}
//#Preview {
//    ManufacturingCompaniesDetailsView(company: Company(name: "Disney", description: "some", email: "@gmail", location: "chicago", image: URL(string: "https://example.com/kellanova.png"), summary: "short description", phone: "223", focus: "life, eating, and something"))
//}
