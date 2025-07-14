//

import Foundation

enum CIRNWebsiteType {
	case aboutUs
	case membership
	case support
	
	var url: URL {
		switch self {
		case .aboutUs:
			return URL(string: "https://www.mfgren.org/cirn/")!
		case .membership:
			return URL(string: "https://mfgren.my.site.com/cirnapp/")!
		case .support:
			return URL(string: "https://mfgren.my.site.com/ewintake/")!
		}
	}
}
