//
//  JobViewModel.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/20/25.
//

import Foundation

class JobViewModel: ObservableObject {
    @Published var jobs: [Job] = [
        Job(title: "Chicago Steel Works", description: "Heavy steel manufacturing company in South Chicago."),
        Job(title: "Urban Metals Inc.", description: "Recycling and sheet metal processing firm."),
        Job(title: "West Side Gears", description: "Precision gear production for industrial machines."),
        Job(title: "Lakeview Tool & Die", description: "Makers of custom tools and dies."),
        Job(title: "Midwest Fabrication Co.", description: "Metal fabricators for automotive and aerospace.")
    ]
}
