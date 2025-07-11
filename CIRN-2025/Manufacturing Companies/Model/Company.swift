//
//  Company.swift
//  CIRN-2025
//
//  Created by Amado Perez - on 6/18/25.
//

import Foundation
    //struct that creates a variable that could store multiple infromation inside
    //Allowing to add multiple things in one line
    struct Company: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let email: String
        let location: String
        let image: URL?
        let summary: String
        let phone: String
        let focus: String
    }
