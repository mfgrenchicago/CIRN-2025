//
//  ManufacturingAPIDetailsView.swift
//  CIRN-2025
//
//  Created by Lola Feurer on 7/22/25.
//

import SwiftUI
import MapKit

struct ManufacturingAPIDetailsView: View {
    
    @StateObject var viewModel: ManufacturingAPIDetailsViewModel    
    
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                
                Text(viewModel.apiCompany.displayName?.text ?? "")
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    
                
                Text(viewModel.apiCompany.shortFormattedAddress)
                Divider()
                
                // Mock description
                Text("Chicago's trusted partner for durable, custom-made manufacturing solutions")
                    .multilineTextAlignment(.center)
                    .padding()
               
                Map(initialPosition: viewModel.cameraPosition) {
                    Marker(viewModel.apiCompany.displayName?.text ?? "", coordinate: viewModel.businessLocation)
                }
                .frame(height: 200)
                .ignoresSafeArea()
                .cornerRadius(10)
                .padding()
                
               
                
                if let website = viewModel.apiCompany.websiteUri {
                    Link(destination: website) {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                            Text("Website")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(.blue.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, 16)
                    
                } else {
                    HStack {
                        Spacer()
                        Text("No Website Available")
                        Spacer()
                    }
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 16)
                }
                
                
                
                DisclosureGroup("Reviews") {
                    VStack {
                        if let reviews = viewModel.apiCompany.reviews, !reviews.isEmpty {
                            ForEach(reviews) { review in
                                VStack {
                                    Text(review.text?.text ?? "")
                                        .padding()
                                }
                            }
                        } else {
                            Text("No reviews")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                .background(.white.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 16)
                
                AsyncImage(url: viewModel.apiCompany.firstPhotoURL) { image in
                    image
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                
            }
            .background(LinearGradient(colors: [Color.purple.opacity(0.3), Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
    
    #Preview {
        // ManufacturingAPIDetailsView(apiCompany: <#T##APICompany#>)
    }
}
