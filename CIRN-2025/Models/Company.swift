//
//  Company.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/18/25.
//

import Foundation
    //struct that creates a variable that could store multiple infromation inside
    //Allowing to add multiple things in one line
    struct Company: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let email: String
        let location: String
        let image: URL?
        let summary: String
        let phone: String
        let focus: String
    }


struct ManufacturerResponse: Decodable {
	let places: [APICompany]
}

// To view all possible properties check https://developers.google.com/maps/documentation/places/web-service/reference/rest/v1/places
struct APICompany: Identifiable, Decodable {
	let id: String
	let displayName: CompanyLocalizedText?
	let editorialSummary: CompanyLocalizedText?
	let generativeSummary: CompanyGenerativeSummary?
	let name: String
	let location: CompanyLocation
	let photos: [CompanyPhoto]?
	let nationalPhoneNumber: String?
	let internationalPhoneNumber: String?
	let formattedAddress: String
	let shortFormattedAddress: String
	let rating: Double?
	let googleMapsUri: URL?
	let websiteUri: URL?
	let reviews: [CompanyReview]?
	
	var firstPhotoURL: URL? {
		guard let firstPhoto = photos?.first else {
			return nil
		}
		return URL(string: "https://places.googleapis.com/v1/\(firstPhoto.name)/media?key=\(APIKey.key)&maxHeightPx=200")
	}
	
	var reviewRating: Int {
		return Int(rating ?? 0)
	}
}

struct CompanyLocation: Decodable {
	let latitude: Double
	let longitude: Double
}

struct CompanyPhoto: Decodable {
	let name: String
	let widthPx: Double
	let heightPx: Double
}

struct CompanyReview: Decodable, Identifiable {
	let id = UUID()
	let name: String?
	let text: CompanyLocalizedText?
	let relativePublishTimeDescription: String?
	let authorAttribution: ReviewAuthorInfo?
}

struct ReviewAuthorInfo: Decodable {
	let displayName: String?
	let uri: URL?
	let photoUri: URL?
}

struct CompanyLocalizedText: Decodable {
	let text: String
}

struct CompanyGenerativeSummary: Decodable {
	let overview: CompanyLocalizedText
}
