//
//  City.swift
//  Register
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

struct City : Codable {
    let disabled : Bool?
    let group : String?
    let selected : Bool?
    let text : String?
    let value : String?

    enum CodingKeys: String, CodingKey {

        case disabled = "Disabled"
        case group = "Group"
        case selected = "Selected"
        case text = "Text"
        case value = "Value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        disabled = try values.decodeIfPresent(Bool.self, forKey: .disabled)
        group = try values.decodeIfPresent(String.self, forKey: .group)
        selected = try values.decodeIfPresent(Bool.self, forKey: .selected)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }

}
