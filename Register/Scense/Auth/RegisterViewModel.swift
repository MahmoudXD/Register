//
//  RegisterViewModel.swift
//  Register
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

class RegisterViewModel {
    
    var countryUseCase: CountryUseCase?
    var countries: [Country] = [Country]() {
        didSet {
            self.didCategoryFetch?()
        }
    }
    
    var cities: [City] = [City]() {
        didSet {
            self.didCategoryFetch?()
        }
    }
    
    var didCategoryFetch: (() -> Void)?
    var didNoHasChild: (() -> Void)?
    var didSelectCategory: ((Int) -> Void)?
    var countryId = -1
    
    init() {
        let countryAPI: CountryAPI = CountryAPIImplementation()
        let countryGateways: CountryGateways = APIGatewayCountryImplementation(countryAPI: countryAPI)
        countryUseCase = CountryUseCaseImplementation(countryGateways: countryGateways)
    }
    
    var numberOfCountry: Int {
        return countries.count
    }
    
    var numberOfCities: Int {
        return cities.count
    }
    
    func viewDidLoad() {
        self.fetchCountries()
    }
    
    func fetchCountries() {
        self.countryUseCase?.getCountry { result in
            switch result {
            case .success(let success):
                self.countries = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCities() {
        self.countryUseCase?.getCity(countryId: countryId) { result in
            switch result {
            case .success(let success):
                self.cities = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func getTitle(raw: Int, isCountry: Bool) -> String {
        var title = ""
        if isCountry {
            title = "lang".localized == "en" ? countries[raw].nameEn ?? "" : countries[raw].nameAr ?? ""
        } else {
            title = cities[raw].text ?? ""
        }
        return title
    }
    
    func didTapped(row: Int, isCountry: Bool) -> String {
        if isCountry {
            countryId = countries[row].countryId ?? -1
            self.fetchCities()
        }
        
        let title = "lang".localized == "en" ? isCountry ? countries[row].nameEn ?? "" : cities[row].text ?? "" : isCountry ? countries[row].nameAr ?? "" : cities[row].text ?? ""
        return title
    }
}
