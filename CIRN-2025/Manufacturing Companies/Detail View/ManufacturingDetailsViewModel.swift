//
import UIKit
import Foundation

class ManufacturingDetailsViewModel: ObservableObject {
	
	let company: Company
	@Published var showAlert: Bool = false
	
	init(company: Company) {
		self.company = company
	}
	
	// Must be done on a real physical device
	func makeACall() {
		guard let url = URL(string: "tel://\(company.nationalPhoneNumber ?? company.internationalPhoneNumber ?? "")"),
			  UIApplication.shared.canOpenURL(url) else { return }
		if #available(iOS 10, *) {
			UIApplication.shared.open(url)
		} else {
			UIApplication.shared.openURL(url)
		}
	}
}
