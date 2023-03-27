//
//  AddressModel.swift
//  Assignment3
//
//  Created by Shane Peek on 3/25/23.
//

import Foundation

struct AddressModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let postalCode : String
    let city : String
    let stateCode : String
    let line1 : String
    let line2 : String
    let line3 : String
    let type : String
}
