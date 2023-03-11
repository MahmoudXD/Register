//
//  Country.swift
//  Register
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

struct Country : Codable {
    let countryId : Int?
    let nameAr : String?
    let nameEn : String?
    let name : String?
    let flag : String?
    let code : Int?
    let active : Bool?
    let order : Int?
    let rowNumber : Int?

    enum CodingKeys: String, CodingKey {

        case countryId = "CountryId"
        case nameAr = "NameAr"
        case nameEn = "NameEn"
        case name = "Name"
        case flag = "Flag"
        case code = "Code"
        case active = "Active"
        case order = "Order"
        case rowNumber = "RowNumber"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
        nameAr = try values.decodeIfPresent(String.self, forKey: .nameAr)
        nameEn = try values.decodeIfPresent(String.self, forKey: .nameEn)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        flag = try values.decodeIfPresent(String.self, forKey: .flag)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        rowNumber = try values.decodeIfPresent(Int.self, forKey: .rowNumber)
    }

}
