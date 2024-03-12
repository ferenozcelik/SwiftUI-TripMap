//
//  Location.swift
//  TripMap
//
//  Created by Fatih Eren Ozcelik on 11.03.2024.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
//    var id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
