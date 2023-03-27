//
//  ParkImageModel.swift
//  Assignment3
//
//  Created by Shane Peek on 3/25/23.
//

import Foundation

struct ParkImageModel : Codable, Identifiable {
    let id = UUID()
    let credit : String
    let title : String
    let altText : String
    let caption : String
    let url : String
}
