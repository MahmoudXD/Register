//
//  APIError.swift
//  AbiKarshak
//
//  Created by Mahmoud Sherbeny on 30/11/2021.
//

import Foundation

enum APIError: Error {
    case noNetwork
    case serverOverload
    case permissionDenied
    case incorrectModel
    case noFoundResponse
    case dataNotFound
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noNetwork:
            return "No Network."
        case .serverOverload:
            return "Server is overloaded."
        case .permissionDenied:
            return "You don't have permission."
        case .incorrectModel:
            return "Error data."
        case .noFoundResponse:
            return "Server not found response"
        case .dataNotFound:
            return "Data not found response"
        }
    }
}
