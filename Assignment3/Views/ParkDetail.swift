//
//  ParkDetail.swift
//  Assignment3
//
//  Created by Shane Peek on 3/25/23.
//

import SwiftUI
import MapKit

struct ParkDetail: View {
    
    var park : ParkModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(park.fullName)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                AddressView(addresses : park.addresses)
                    .padding(.horizontal)
                MapView(coordinate: CLLocationCoordinate2D(latitude: Double(park.latitude)!, longitude: Double(park.longitude)!))
                    .frame(height: 300)
                ContactView(icon: "phone", contact: park.contacts.phoneNumbers[0].phoneNumber)
                    .padding(.horizontal)
                Text(park.description)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                OperatingHoursView()
                    .padding(.horizontal)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem()]) {
                        ForEach(park.images.prefix(5)) { image in
                            ImageCardView(url: image.url)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
