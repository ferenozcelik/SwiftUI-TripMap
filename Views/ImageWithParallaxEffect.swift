//
//  ImageWithParallaxEffect.swift
//  TripMap
//
//  Created by Fatih Eren Ozcelik on 13.03.2024.
//

import SwiftUI

struct ImageWithParallaxEffect: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                let size = geometry.size
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(location.imageNames, id: \.self) { imageName in
                            GeometryReader(content: { proxy in
                                let cardSize = proxy.size
                                //  let minX = proxy.frame(in: .scrollView).minX
                                let minX = min((proxy.frame(in: .scrollView).minX - 50.0 * 1.2), size.width * 1.2)
                                
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .offset(x: -minX)
                                //  .frame(width: proxy.size.width * 1.5)
                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                    .border(Color.black, width: 6)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            })
                            .frame(width: size.width - 60)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view
                                    .scaleEffect(phase.isIdentity ? 1 : 0.90)
                            }
                        }
                    }
                    .padding(.horizontal, 26)
                    .scrollTargetLayout()
                    .frame(height: size.height, alignment: .top)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            })
            .frame(height: 450)
//            .background(.red)
            .padding(.leading, -15)
            .padding(.trailing, -10)
        }
        .padding(.top)
    }
}

#Preview {
    ImageWithParallaxEffect(location: LocationsViewModel().locations.first!)
        .environmentObject(LocationsViewModel())
}
