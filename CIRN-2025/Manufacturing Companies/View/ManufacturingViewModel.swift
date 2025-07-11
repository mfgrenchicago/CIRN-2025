//
//  File.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/23/25.
//

import Foundation

class ManufacturingViewModel: ObservableObject {
    @Published var companies: [Company] = []
	@Published var searchText: String = ""
	
	@Published var isLoading: Bool = false
	
	@Published var showErrorAlert: Bool = false
	@Published var errorMessage: String = ""
	
	let apiService: ManufacturersAPIService
	
	init(apiService: ManufacturersAPIService) {
		self.apiService = apiService
	}
	
	@MainActor
	func fetchManufacturers() async {
		// Defer is the last thing called in the function
		
		defer {
			// Hide Spinner/ProgressView
			isLoading = false
		}
		
		// Show Spinner/ProgressView
		isLoading = true
		
		do {
			// Use `ManufacturersAPIService` to get data
			let companies = try await apiService.fetchManufacturers(query: searchText)
			
			self.companies = companies
		} catch {
			// Show error message
			if let customError = error as? ManufacturersAPIError {
				errorMessage = customError.errorMessageText
				showErrorAlert.toggle()
			}
			
		}
	}
}

