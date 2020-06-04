//
//  FormUtils.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import UIKit
import Foundation

public enum FormInputState {
    case active
    case inactive
}

public enum FormValidationState {
    case valid
    case invalid
    case inactive
}

public struct FormInputKeyboardConfig {
    public var isSecure: Bool = false
    public var textContentType: UITextContentType?
    public var keyboardType: UIKeyboardType = .default
    public var returnKeyType: UIReturnKeyType = .default
    public var autocapitalizationType: UITextAutocapitalizationType = .none
    
    public init(textContentType: UITextContentType? = nil,
                keyboardType: UIKeyboardType = .default,
                returnKeyType: UIReturnKeyType = .default,
                isSecure: Bool = false,
                autocapitalizationType: UITextAutocapitalizationType = .none) {
        self.textContentType = textContentType
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.isSecure = isSecure
        self.autocapitalizationType = autocapitalizationType
    }
}

public struct FormInputConfiguration {
    public var inputFont: UIFont
    public var placeholderFont: UIFont
    
    public var titleColor: UIColor
    public var inputColor: UIColor
    public var invalidColor: UIColor
    public var placeholderColor: UIColor
    
    public init() {
        inputFont = UIFont()
        placeholderFont = UIFont()
        
        titleColor = .black
        inputColor = .black
        invalidColor = .red
        placeholderColor = .gray
    }
}

