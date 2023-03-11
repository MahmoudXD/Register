//
//  BaseAPI.swift
//  Network
//
//  Created by Mahmoud Sherbeny on 29/08/2021.
//

import Foundation
import Alamofire
import NetworkExtension

class BaseAPI<T: TargetType> {
    
    var saerchRequest: Request?
    
    private func hasInternet() -> Bool {
        guard let isConnected = NetworkReachabilityManager()?.isReachable else {
            return false
        }
        return isConnected
    }
    
    private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
    
    func sendRequest<D: Decodable>(target: T,
                                   responseClass: D.Type,
                                   callBack: @escaping (Result<D, Error>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameters(task: target.task)
        
        if !hasInternet() {
            callBack(.failure(APIError.noNetwork))
            return
        }
        
        var allowedStatusCodes = Set(200..<500)
        allowedStatusCodes.remove(440)
        
        AF.request(target.baseURL + target.path,
                   method: method, parameters: params.0,
                   encoding: params.1,
                   headers: headers,
                   interceptor: CustomIntercepter()).validate(statusCode: allowedStatusCodes).responseJSON { response in
            guard let statusCode = response.response?.statusCode else {
                callBack(.failure(APIError.serverOverload))
                return
            }
            
            if statusCode == 400 {
                callBack(.failure(APIError.dataNotFound))
            } else if statusCode != 404 {
                guard let jsonResponse = try? response.result.get() else {
                    callBack(.failure(APIError.noFoundResponse))
                    return
                }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    callBack(.failure(APIError.incorrectModel))
                    return
                }
                
                guard let date = try? JSONDecoder().decode(D.self, from: jsonData) else {
                    print(jsonResponse)
                    callBack(.failure(APIError.incorrectModel))
                    return
                }
                
                callBack(.success(date))
            } else {
                callBack(.failure(APIError.noFoundResponse))
            }
        }
    }
}
