//
//  CustomIntercepter.swift
//  Network
//
//  Created by Mahmoud Sherbeny on 30/08/2021.
//

import Foundation
import Alamofire

class CustomIntercepter: RequestInterceptor {
    
    var retryCount = 0
    
    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        //TODO: refrech token
    }

}
