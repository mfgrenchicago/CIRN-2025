//
//  Job.swift
//  CIRN-2025
//
//  Created by Barbaros Zorlu on 6/20/25.
//

import Foundation

struct Job: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let telephone: String
    let companyURL: String
    let email: String
    let location: String
    let salary: String
}
