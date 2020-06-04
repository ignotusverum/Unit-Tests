//
//  FormItem.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public struct FormItem {
    public var key: String?
    public var title: String
    public var errorMessage: String
    
    public var input: BehaviorRelay<String> = BehaviorRelay(value: "")
    public var onReturn: BehaviorRelay<Void> = BehaviorRelay(value: ())
    
    public var validationRegex: RegexExpressions
    public var keyboardConfig: FormInputKeyboardConfig
    
    public var validationError: RegexValidationError?
    
    public init(key: String? = nil,
                title: String,
                errorMessage: String,
                validationRegex: RegexExpressions,
                keyboardConfig: FormInputKeyboardConfig = FormInputKeyboardConfig()) {
        self.key = key
        self.title = title
        self.errorMessage = errorMessage
        self.keyboardConfig = keyboardConfig
        self.validationRegex = validationRegex
    }
    
    public func validate() -> RegexValidationError? {
        return validateString(input.value,
                              pattern: validationRegex.regex)
    }
    
    public func isValidObservable() -> Observable<RegexValidationError?> {
        return input
            .asObservable()
            .map {
                self.validateString($0,
                                    pattern: self.validationRegex.regex) }
            .asObservable()
    }
    
    private func validateString(_ value: String?,
                                pattern: String) -> RegexValidationError? {
        let test = NSPredicate(format: "SELF MATCHES %@", pattern)
        return test.evaluate(with: value) ? nil : validationRegex.generateError()
    }
}

extension FormItem: Equatable {
    public static func == (lhs: FormItem,
                           rhs: FormItem) -> Bool {
        return lhs.title == rhs.title
    }
}

