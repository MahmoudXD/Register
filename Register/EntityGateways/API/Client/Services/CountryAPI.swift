//
//  CategoryAPI.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CountryAPI {
    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void)
    func getCity(countryId: Int, callBack: @escaping (Result<[City], Error>) -> Void)
}

class CountryAPIImplementation: BaseAPI<CountryNetwork>, CountryAPI {
    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void) {
        self.sendRequest(target: .getCountry, responseClass: [Country].self, callBack: callBack)
    }
    
    func getCity(countryId: Int, callBack: @escaping (Result<[City], Error>) -> Void) {
        self.sendRequest(target: .getCity(countryId: countryId), responseClass: [City].self, callBack: callBack)
    }
}
