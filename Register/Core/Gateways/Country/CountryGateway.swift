//
//  CategoryGateway.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CountryGateways {
    func getCountry(callBack: @escaping (Result<[Country], Error>) -> Void)
    func getCity(countryId: Int,
                 callBack: @escaping (Result<[City], Error>) -> Void)
}
