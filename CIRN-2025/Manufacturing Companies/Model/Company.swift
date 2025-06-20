//
//  Company.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/18/25.
//

import Foundation
class ManufacturingViewModel {
    //struck that creates a variable that could store multiple infromation inside
    //Allowing to add multiple things in one line
    struct Company: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let email: String
    }
    var companys: [Company] = [
        Company(name: "Company", description: "++++", email: "Contact info"),
        Company(name: "Archer-Daniels-Midland Company", description: "++++", email: "Contact info"),
        Company(name: "AbbVie Inc.", description: "++++", email: "Contact info"),
        Company(name: "Mondelez International, Inc.", description: "++++", email: "Contact info"),
        Company(name: "GE HealthCare Technologies Inc.", description: "++++", email: "Contact info")
    ]
}
