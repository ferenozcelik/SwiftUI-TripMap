//
//  TripMapApp.swift
//  TripMap
//
//  Created by Fatih Eren Ozcelik on 11.03.2024.
//

import SwiftUI

@main
struct TripMapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
