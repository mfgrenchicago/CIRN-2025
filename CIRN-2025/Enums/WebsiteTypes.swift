//

import Foundation

enum WebsiteTypes {
	case support
	case membership
	case aboutUs
	
	// computed property
	var website: URL {
		switch self {
		case .aboutUs:
			return URL(string: "http://www.mfgren.org/cirn")!
		case .membership:
			return URL(string: "https://mfgren.my.site.com/cirnapp/")!
		case .support:
			return URL(string: "https://mfgren.my.site.com/ewintake/")!
		}
	}
}
