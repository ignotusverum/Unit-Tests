//
//  EntitiesDecodingTests.swift
//  Tests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

@testable import UnitTests
import Nimble
import Quick

extension JSONDecoder {
    static var iso8601FullDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Full)
        return decoder
    }
}

class EntitiesDecodingTests: QuickSpec {
    func canDecode<T: Decodable>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> (Data) throws -> T {
        return { try decoder.decode(T.self, from: $0) }
    }
    
    override func spec() {
        describe("a bundle") {
            let bundle = Bundle(for: EntitiesDecodingTests.self)
            let resources: [(String, (Data) throws -> Any)] = [
                ("feed_women", canDecode(Feed.self, decoder: .iso8601FullDecoder)),
                ("app_config", canDecode(Config.self)),
            ]
            
            for (resource, canDecode) in resources {
                describe("from \(resource) json") {
                    let path = bundle.path(forResource: resource, ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    
                    it("can decode to object") {
                        expect { try canDecode(data) }.notTo(throwError())
                    }
                }
            }
        }
    }
}

