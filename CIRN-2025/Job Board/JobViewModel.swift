//
//  JobViewModel.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/20/25.
//

import Foundation

class JobBoardViewModel  {
     var jobs: [Job] = [
        Job(
			title: "Product Manager", companyName: "Chicago Steel Works",
            description: "Heavy steel manufacturing company in South Chicago.",
            telephone: "312-555-0101",
            companyURL: "https://chicagosteelworks.com",
            email: "contact@chicagosteelworks.com",
            location: "South Chicago, IL",
            salary: "$55,000 - $70,000"
        ),
        Job(
			title: "Engineer", companyName: "Urban Metals Inc.",
            description: "Recycling and sheet metal processing firm.",
            telephone: "312-555-0123",
            companyURL: "https://urbanmetals.com",
            email: "info@urbanmetals.com",
            location: "West Loop, Chicago, IL",
            salary: "$50,000 - $65,000"
        ),
        Job(
			title: "Engineer II", companyName: "West Side Gears",
            description: "Precision gear production for industrial machines.",
            telephone: "773-555-0202",
            companyURL: "https://westsidegears.com",
            email: "hr@westsidegears.com",
            location: "West Side, Chicago, IL",
            salary: "$60,000 - $75,000"
        ),
        Job(
			title: "Scrum Master", companyName: "Lakeview Tool & Die",
            description: "Makers of custom tools and dies.",
            telephone: "312-555-0999",
            companyURL: "https://lakeviewtools.com",
            email: "jobs@lakeviewtools.com",
            location: "Lakeview, Chicago, IL",
            salary: "$52,000 - $68,000"
        ),
        Job(
			title: "iOS Engineer", companyName: "Midwest Fabrication Co.",
            description: "Metal fabricators for automotive and aerospace.",
            telephone: "847-555-0333",
            companyURL: "https://midwestfabco.com",
            email: "apply@midwestfabco.com",
            location: "Northwest Suburbs, IL",
            salary: "$58,000 - $73,000"
        ),
        Job(
			title: "UI/UX Designer", companyName: "Elkay Manufacturing Company",
            description: "Chicago-based maker of stainless‑steel sinks and faucets.",
            telephone: "847-555-0456",
            companyURL: "https://elkay.com",
            email: "careers@elkay.com",
            location: "Oak Brook, IL",
            salary: "$54,000 - $70,000"
        ),
        Job(
			title: "CAD Developer", companyName: "Littelfuse, Inc.",
            description: "Electronics manufacturer of fuses and circuit protection headquartered in Chicago.",
            telephone: "773-555-0623",
            companyURL: "https://littelfuse.com",
            email: "talent@littelfuse.com",
            location: "Ravenswood, Chicago, IL",
            salary: "$61,000 - $76,000"
        ),
        Job(
			title: "CAD Developer III", companyName: "USG Corporation",
            description: "Chicago-headquartered manufacturer of drywall, gypsum and building materials.",
            telephone: "312-555-0789",
            companyURL: "https://usg.com",
            email: "recruitment@usg.com",
            location: "Downtown Chicago, IL",
            salary: "$57,000 - $72,000"
        ),
        Job(
			title: "Sr. Android Engineer", companyName: "Illinois Tool Works",
            description: "Fortune 500 company producing engineered fasteners and components near Chicago.",
            telephone: "847-555-0888",
            companyURL: "https://itw.com",
            email: "hiring@itw.com",
            location: "Glenview, IL",
            salary: "$65,000 - $80,000"
        ),
        Job(
			title: "Product Owner", companyName: "OSI Group (Chicago plants)",
            description: "Meat‑processing manufacturing plants operated in Chicago for foodservice supply.",
            telephone: "630-555-0955",
            companyURL: "https://osigroup.com",
            email: "work@osigroup.com",
            location: "Aurora, IL",
            salary: "$50,000 - $66,000"
        )
    ]
}

