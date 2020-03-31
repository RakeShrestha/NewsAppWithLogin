//
//  APIConstants.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import Foundation

struct ResponseCodes {
    static let success = 200
    static let created = 201
    static let badRequest = 400
    static let badToken = 401
    static let forbidden = 403
    static let conflict = 409
    static let notFound = 404
    static let serverError = 500
    static let unexpected = 1000
    static let timeOut = 1001
    static let noInternet = 999
}

struct ResponseText {
    static let badToken = "You look like you need a fresh session! Please try logging in again!"
    static let notFound = "Oops! We could't find anything with the information you provided!"
    static let forbidden = "Erm! Are you sure you have the authority to do that?"
    static let serverError = "Whoa! Something went wrong! Please try again later!"
    static let unexpected = "Whoa! Looks like there's something wrong! Please try again later!"
    static let timeOut = "Sorry but this took unexpectedly long! Please try again!"
    static let badRequest = "Oops! Looks like you made a bad request!"
}
