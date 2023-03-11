//
//  APIGatewayCategoryImplementation.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

class APIGatewayCountryImplementation: CountryGateways {
    
    private let countryAPI: CountryAPI
    
    init(countryAPI: CountryAPI) {
        self.countryAPI = countryAPI
    }

    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void) {
        self.countryAPI.getCountry(callBack: callBack)
    }
    
    func getCity(countryId: Int,
                 callBack: @escaping (Result<[City], Error>) -> Void) {
        self.countryAPI.getCity(countryId: countryId, callBack: callBack)
    }
}
