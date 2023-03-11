//
//  CategoryNetwork.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import Alamofire

enum CountryNetwork {
    case getCountry,
         getCity(countryId: Int)
}

extension CountryNetwork: TargetType {
    var baseURL: String {
        switch self {
        default:
            return BASEURL
        }
    }
    
    var path: String {
        switch self {
        case .getCountry:
            return "Countries"
        case .getCity(let countryId):
            return "States?countryId=\(countryId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCountry, .getCity:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCountry, .getCity:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }
}
