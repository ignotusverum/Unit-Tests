//
//  RegexValidation.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public enum RegexValidationError: Error {
    public var errorTitle: String? { "Error" }
    public var errorMessage: String? { localizedDescription }
    
    case email
    case isEmpty
    case password
    case `default`
    
    var localizedDescription: String {
        switch self {
        case .email: return "Validation Email"
        case .isEmpty: return "Validastion Empty"
        case .password: return "ValidationPassword"
        case .default: return "Validation Error"
        }
    }
    
    var code: Int {
        switch self {
        case .email: return 10000
        case .isEmpty: return 10001
        case .password: return 10002
        case .default: return 9999
        }
    }
}

extension RegexValidationError: Equatable {
    public static func == (lhs: RegexValidationError,
                           rhs: RegexValidationError) -> Bool {
        return lhs.code == rhs.code
    }
}

public struct RegexExpressions: Equatable {
    public let regex: String
    
    public static let email = RegexExpressions(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    public static let isEmpty = RegexExpressions(regex: ".*\\S.*")
    public static let password = RegexExpressions(regex: "^([a-zA-Z0-9@*#]{6,15})$")
    
    public func generateError() -> RegexValidationError {
        switch self {
        case .email: return .email
        case .isEmpty: return .isEmpty
        case .password: return .password
        default: return .default
        }
    }
}

