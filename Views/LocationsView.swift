//
//  LocationsView.swift
//  TripMap
//
//  Created by Fatih Eren Ozcelik on 11.03.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(initialPosition: MapCameraPosition.region(vm.mapRegion))
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
