//
//  FeedConfig.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public struct FeedConfig: Decodable {
    private enum CodingKeys: CodingKey {
        case type
        case url
    }
    
    public var urlString: String
    public var typeString: String
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public var type: Gender? {
        return Gender(rawValue: typeString)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        urlString = try container.decode(String.self, forKey: .url)
        typeString = try container.decode(String.self, forKey: .type)
    }
}

