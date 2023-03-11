//
//  Category.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CountryUseCase {
    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void)
    func getCity(countryId: Int,
                 callBack: @escaping (Result<[City], Error>) -> Void)
}

class CountryUseCaseImplementation: CountryUseCase {
    
    private let countryGateways: CountryGateways

    init(countryGateways: CountryGateways) {
        self.countryGateways = countryGateways
    }

    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void) {
        self.countryGateways.getCountry(callBack: callBack)
    }
    
    func getCity(countryId: Int, callBack: @escaping (Result<[City], Error>) -> Void) {
        self.countryGateways.getCity(countryId: countryId, callBack: callBack)
    }
}
