//

import Foundation

// MARK: Protocol which tells what kind of services are offered
protocol ManufacturersAPIService {
	func fetchManufacturers(query: String) async throws -> [Company]
}

// MARK: Custom Errors that can be caused from API
enum ManufacturersAPIError: Error {
	case invalidURL
	case invalidRequest
	case httpURLError
	case invalidStatusCode
	case decodeError
	case unknown(String)
	
	var errorMessageText: String {
		switch self {
		case .invalidURL:
			return "Invalid URL"
		case .invalidRequest:
			return "Issue with the request sent"
		case .httpURLError:
			return "HTTP URL issue"
		case .invalidStatusCode:
			return "Invalid Status Code"
		case .decodeError:
			return "Decoding of data issue, check `Company` Model in CIRN-2025 project"
		case .unknown(let errorMsg):
			return "Something went wrong: \(errorMsg)"
		}
	}
}

// MARK: API key for using the API
// TODO: Encrypt/Hide API Key better!
struct APIKey {
	static var key: String = "AIzaSyDS8ExuhM1G9qd6ZnVYACkhqGUpHx5fOvI"
}

// Class which uses the `ManufacturersAPIService` to make API calls
class ManufacturersAPIServiceImpl: ManufacturersAPIService {
	
	// Endpoint to fetch data from API
	private let endpoint: String = "https://places.googleapis.com/v1/places:searchText"
	
	func fetchManufacturers(query: String) async throws -> [Company] {
		
		// Convert the endpoint(String) to a `URL`
		guard let url = URL(string: endpoint) else {
			// If fail to convert, then throw a `invalidURL` error
			throw ManufacturersAPIError.invalidURL
		}
		
		// Pass in the information we want to search for using `textQuery`
		// Set the max about of search results using `pageSize`
		let requestBody = ["textQuery": "manufacturing companies in chicago", "pageSize": "30"]
		
		// Encode the request so we can send to the API to get data
		let encodedData = try JSONSerialization.data(withJSONObject: requestBody)
		
		// Create `urlRequest` to get data
		var urlRequest = URLRequest(url: url)
		
		// Requirements needed for the urlRequest: headers, method & body(encoded data)
		urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json", "X-Goog-Api-Key": APIKey.key, "X-Goog-FieldMask": "*"]
		urlRequest.httpMethod = "POST"
		urlRequest.httpBody = encodedData
		
		do {
			// Make API call using Swift concurrency
			let (data, response) = try await URLSession.shared.data(for: urlRequest)
			
			guard let httpResponse = response as? HTTPURLResponse else {
				throw ManufacturersAPIError.httpURLError
			}
			
			// Check if received a valid status code: between 200-299
			guard (200...299).contains(httpResponse.statusCode) else {
				throw ManufacturersAPIError.invalidStatusCode
			}
			
			do {
				// Decode the data that we received from the API
				let decoder = JSONDecoder()
				let manufacturers = try decoder.decode(ManufacturerResponse.self, from: data)
				
				// Send the data with Companies for whoever is using the service
				return manufacturers.places
			} catch {
				throw ManufacturersAPIError.decodeError
			}
			
		} catch {
			throw ManufacturersAPIError.unknown(error.localizedDescription)
		}
	}
}
