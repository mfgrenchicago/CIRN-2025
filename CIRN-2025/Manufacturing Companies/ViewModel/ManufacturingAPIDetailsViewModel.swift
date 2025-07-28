//
//  ManufacturingAPIDetailsViewModel.swift
//  CIRN-2025
//
//  Created by Lola Feurer on 7/25/25.
//

import Foundation
import MapKit
import SwiftUI

class ManufacturingAPIDetailsViewModel: ObservableObject {
    let apiCompany: APICompany

    init(apiCompany: APICompany) {
        self.apiCompany = apiCompany
    }
    
    var businessLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: apiCompany.location.latitude, longitude: apiCompany.location.longitude)
    }
    
    var cameraPosition: MapCameraPosition {
        .region(.init(center: businessLocation, latitudinalMeters: 1000, longitudinalMeters: 1000))
    }
}


