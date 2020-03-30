//
//  APIServices.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import Foundation
import Alamofire

class APIService{
    
    class func getNewsArticles(onCompletion: @escaping(News?, ResponseError?) -> Void){
        let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=ed3e6031ce8f4593b2c4423a3c488a89"
        AF.request(newsURL,
        method: .get,
        encoding: JSONEncoding.default,
        headers: ["Accept" : "application/json"]).debugLog().responseDecodable(of: News.self){
                    response in
                    if let statusCode = response.response?.statusCode{
                        if statusCode == ResponseCodes.success{
                            print(response)
                            if let response = response.value{
                                onCompletion(response, nil)
                            }
                        }else if statusCode == ResponseCodes.notFound{
                            onCompletion(nil, ResponseError.init(description: ResponseText.notFound, code: statusCode))
                        }else if statusCode == ResponseCodes.serverError{
                            onCompletion(nil, ResponseError.init(description: ResponseText.serverError, code: statusCode))
                        }else if statusCode == ResponseCodes.badRequest{
                            onCompletion(nil, ResponseError.init(description: ResponseText.badRequest, code: statusCode))
                        }else{
                            onCompletion(nil, ResponseError.init(description: ResponseText.unexpected, code: statusCode))
                        }
                    }else{
                        if let error = response.error{
                            if error.responseCode == ResponseCodes.timeOut{
                                onCompletion(nil, ResponseError.init(description: ResponseText.timeOut, code: ResponseCodes.timeOut))
                            }else{
                                onCompletion(nil, ResponseError.init(description: ResponseText.unexpected, code: ResponseCodes.unexpected))
                            }
                        }
                        else{
                            onCompletion(nil, ResponseError.init(description: ResponseText.unexpected, code: ResponseCodes.unexpected))
                        }
                    }
                    
        }
    }
    
}
