//
//  OperatingHoursModel.swift
//  Assignment3
//
//  Created by Shane Peek on 3/25/23.
//

import Foundation

struct OperatingHoursModel : Codable {
    let standardHours : [StandardHoursModel]
}

struct StandardHoursModel : Codable {

    let sunday : String
    let monday : String
    let tuesday : String
    let wednesday : String
    let thursday : String
    let friday : String
    let saturday : String
}
