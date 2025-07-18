//
//  File.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/23/25.
//

import Foundation

class ManufacturingViewModel: ObservableObject {
	
	// MARK: Data from API
	@Published var apiCompanies: [APICompany] = []
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
			let companies = try await apiService.fetchManufacturers(query: "Currently operating manufacturing companies in Chicagoland")
			
			self.apiCompanies = companies
		} catch {
			// Show error message
			if let customError = error as? ManufacturersAPIError {
				errorMessage = customError.errorMessageText
				showErrorAlert.toggle()
			}
			
		}
	}
	
	
	// MARK: Hardcoded Data
	var companys: [Company] = [
		Company(name: "Kellanova", description: "Snack & cereal maker, global", email: "investor.relations@kellanova.com", location: "Chicago, IL", image: URL(string: "https://cdn.companieslogo.com/kellanova/logo.png"), summary: "Leading global snack and cereal company formed in 2023 from the former Kellogg Co, offering iconic brands like Pringles, Cheez-It, RXBAR, Eggo, MorningStar Farms, and plant-based foods", phone: "800‑352‑2366", focus: "Snacks, breakfast cereals, plant-based foods, frozen waffles."),
		
		Company(name: "Archer-Daniels-Midland Company", description: "Agriculture & nutrition leader", email: "admgrainmarketingservices@adm.com", location: "Decatur, IL", image: URL(string: "https://cdn.companieslogo.com/archer-daniels-midland/logo.png"), summary: "Global leader in agricultural origination, processing, and human/animal nutrition; supplies commodities, oils, and food ingredients", phone: "217‑424‑5200", focus: "Grain origination, oilseed processing, animal feed, food & feed ingredients."),
		
		Company(name: "AbbVie Inc.", description: "Biopharma innovator", email: "abbviemediarelations@abbvie.com", location: "North Chicago, IL", image: URL(string: "https://cdn.companieslogo.com/abbvie/logo.png"), summary: "Biopharmaceutical innovator emphasizing advanced science in drug and treatment discovery across immunology, oncology, neuroscience, and virology", phone: "847‑935‑4170", focus: "Specialty pharmaceuticals, R&D, and biologic therapies."),
		
		Company(name: "Mondelez International, Inc.", description: "Global snacks company", email: "HRconnect@mdlz.com", location: "Chicago, IL (Deerfield HQ)", image: URL(string: "https://cdn.companieslogo.com/mondelez/logo.png"), summary: "Global snack-food powerhouse producing cookies, chocolate, gum, and powdered beverages under brands like Oreo, Cadbury, and Toblerone.", phone: "847‑943‑4000", focus: "Biscuits, chocolate, gum, coffee/tea, sustainable snacking."),
		
		Company(name: "GE HealthCare Technologies Inc.", description: "Medical tech & imaging", email: "TeamGEHealthcare@gehealthcare.com", location: "Chicago IL", image: URL(string: "https://seeklogo.com/images/G/ge-healthcare-logo-314015DC8E-seeklogo.com.png"), summary: "Developer and manufacturer of medical imaging systems, diagnostics, patient care solutions, and digital healthcare technologies", phone: "847‑723‑4000", focus: "Imaging (MR, CT, PET), diagnostic systems, digital health platforms."),
		
		Company(name: "Conagra Brands, Inc.", description: "Packaged foods", email: "media@conagra.com", location: "Chicago, IL", image: URL(string: "https://cdn.companieslogo.com/conagra-brands/logo.png"), summary: "Major CPG company offering grocery, snacks, refrigerated & frozen foods across U.S., international, and foodservice channels", phone: "312‑549‑5000", focus: "Packaged grocery, frozen/refrigerated meals, culinary & foodservice products."),
		
		Company(name: "Molson Coors Beverage Company", description: "Major brewer", email: "MCBCInvestorRelations@molsoncoors.com", location: "Chicago, IL", image: URL(string: "https://seeklogo.com/images/M/molson-coors-logo-174626FC52-seeklogo.com.pn"), summary: "One of world’s top brewers, operating across the Americas, Europe, and Asia Pacific with beer, hard seltzers, and RTD beverages", phone: "312‑730‑2000", focus: "Brewing, malt beverages, hard seltzers, RTD drinks."),
		
		Company(name: "Motorola Solutions, Inc.", description: "Mission-critical tech", email: "partners.na@motorolasolutions.com", location: "Chicago, IL", image: URL(string: "https://seeklogo.com/images/M/motorola-solutions-logo-309905D8C7-seeklogo.com.png"), summary: "Provider of mission-critical communications and security technologies (radios, software, analytics) serving public safety and enterprise markets", phone: "847‑576‑5000", focus: "Public safety comms, network systems, incident analytics, security."),
		
		Company(name: "R. R. Donnelley & Sons Company", description: "Printing & packaging", email: "N/A", location: "Chicago, IL", image: URL(string: "https://seeklogo.com/images/R/rr-donnelley-logo-30732899F9-seeklogo.com.png"), summary: "Specialist in commercial printing, packaging, labels, and supply-chain services for diverse industries.", phone: "1-800-782-4892", focus: "Print production, flexible packaging, labels, supply-chain logistics."),
		
		Company(name: "Amsted Industries Incorporated", description: "Heavy-industry manufacturer", email: "N/A", location: "Chicago IL", image: URL(string: "https://www.burgessnorton.com/wp-content/uploads/2020/01/Amsted-Industries-Logo.png"), summary: "Manufacturer of engineered metal products—rail components, industrial bearings, wheels, valves, and filtration products.", phone: "312-645-1700", focus: "Railway components, industrial metalcasting, filtration, infrastructure parts."),
		
		Company(name: "Marmon Holdings, Inc.", description: "Diversified manufacturing", email: "N/A", location: "Chicago, IL", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2g5LfzrwXcB3_WH5DBaRUo-CL3A2irvkH0A&s"), summary: "Berkshire Hathaway–owned conglomerate of ~100 manufacturing and service companies across diversified industrial sectors.", phone: "312‑372‑9500", focus: "Diversified manufacturing, industrial equipment, heavy components, services.")
	]
}

