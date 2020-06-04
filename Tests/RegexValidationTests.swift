//
//  RegexValidationTests.swift
//  Tests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

@testable import UnitTests
import Nimble
import Quick

private enum RegexValidationTypes: String {
    case validEmails
    case invalidEmails
    case validPasswords
    case invalidPasswords
    case validNames
    case invalidNames
    
    case unknown
}

class RegexFormItemValidationTests: QuickSpec {
    override func spec() {
        describe("Having mock input data") {
            let mockData = decodeValidationData().data
            
            context("run validation for input form") {
                mockData.forEach { validationModel in
                    
                    let expression: RegexExpressions
                    var expectation: RegexValidationError?
                    
                    switch validationModel.title {
                    case .validEmails:
                        expression = .email
                    case .validNames:
                        expression = .isEmpty
                    case .validPasswords:
                        expression = .password
                    case .invalidEmails:
                        expression = .email
                        expectation = .email
                    case .invalidNames:
                        expression = .isEmpty
                        expectation = .isEmpty
                    case .invalidPasswords:
                        expression = .password
                        expectation = .password
                    case .unknown:
                        expression = .isEmpty
                        expectation = .default
                    }
                    
                    let formItem = FormItem(title: "",
                                            errorMessage: "",
                                            validationRegex: expression)
                    
                    context("validation starts for \(validationModel.title)") {
                        validationModel.data.forEach { input in
                            formItem.input.accept(input)
                            
                            it("run validation") {
                                switch expectation {
                                case .some(let error): expect(formItem.validate()).to(equal(error))
                                case .none: expect(formItem.validate()).to(beNil())
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func decodeValidationData() -> ValidationData {
        let bundle = Bundle(for: RegexFormItemValidationTests.self)
        let path = bundle.path(forResource: "regex_validation", ofType: "json")!
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try! decoder.decode(ValidationData.self, from: data)
    }
}

private struct ValidationData: Decodable {
    let data: [ValidationModel]
    public init(from decoder: Decoder) throws {
        data = try decoder.decodeTitledElements(ValidationModel.self)
    }
}

private struct ValidationModel: Decodable {
    var title: RegexValidationTypes
    var data: [String]
    
    init(from decoder: Decoder) throws {
        let titleString = try? decoder.currentTitle()
        title = RegexValidationTypes(rawValue: titleString ?? "") ?? .unknown
        let container = try decoder.singleValueContainer()
        data = try container.decode([String].self)
    }
}
