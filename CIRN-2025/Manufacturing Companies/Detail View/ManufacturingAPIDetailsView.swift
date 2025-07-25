//
//  ManufacturingAPIDetailsView.swift
//  CIRN-2025
//
//  Created by Lola Feurer on 7/22/25.
//

import SwiftUI
import MapKit

struct ManufacturingAPIDetailsView: View {
    var apiCompany: APICompany
    
    
    var businessLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: apiCompany.location.latitude, longitude: apiCompany.location.longitude)
    }
    
    var cameraPosition: MapCameraPosition {
        .region(.init(center: businessLocation, latitudinalMeters: 1000, longitudinalMeters: 1000))
    }
    
    
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                
                Text(apiCompany.displayName?.text ?? "")
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    
                
                Text(apiCompany.shortFormattedAddress)
                Divider()
                
                // Mock description
                Text("Chicago's trusted partner for durable, custom-made manufacturing solutions")
                    .multilineTextAlignment(.center)
                    .padding()
               
                Map(initialPosition: cameraPosition) {
                    Marker(apiCompany.displayName?.text ?? "", coordinate: businessLocation)
                }
                .frame(height: 200)
                .ignoresSafeArea()
                .cornerRadius(10)
                .padding()
                
               
                
                if let website = apiCompany.websiteUri {
                    Link(destination: website) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Website")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                        }
                        .padding()
                        .background(.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, 16)
                    
                } else{
                    HStack {
                        Spacer()
                        Text("No Website Available")
                        Spacer()
                    }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 16)
                }
                
                
                
                DisclosureGroup("Reviews") {
                    VStack {
                        if let reviews = apiCompany.reviews, !reviews.isEmpty {
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
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 16)
                
                AsyncImage(url: apiCompany.firstPhotoURL) { image in
                    image
                        //.resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                
            }
        }
    }
    
    #Preview {
        // ManufacturingAPIDetailsView(apiCompany: <#T##APICompany#>)
    }
}
