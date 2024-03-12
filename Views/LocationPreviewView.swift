//
//  LocationPreviewView.swift
//  TripMap
//
//  Created by Fatih Eren Ozcelik on 12.03.2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    .environmentObject(LocationsViewModel())
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
        }
        .padding(8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.bordered)
    }
}
