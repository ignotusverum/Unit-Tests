//
//  FeedItem.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public enum FeedItemSectionType: String, Equatable {
    case none
    case editorial
    case guide
    case trunkshow
    case new
}

public enum FeedItem: Codable, Equatable {
    case list(FeedList)
    case banner(FeedItemBanner)
    case unsupported
    
    private enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(FeedType.self, forKey: .type)
        
        switch type {
        case .banner:
            let banner = try FeedItemBanner(from: decoder)
            self = .banner(banner)
        case .list:
            let list = try FeedList(from: decoder)
            self = .list(list)
        default:
            self = .unsupported
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .banner(let featured):
            try container.encode(featured, forKey: .value)
            try container.encode(FeedType.banner, forKey: .type)
        case .list(let list):
            try container.encode(list, forKey: .value)
            try container.encode(FeedType.list, forKey: .type)
        case .unsupported:
            let context = EncodingError.Context(codingPath: [], debugDescription: "Invalid feed type.")
            throw EncodingError.invalidValue(self, context)
        }
    }
}

public enum FeedType: String, Codable, Equatable {
    case card
    case list
    case banner
    case unsupported
    
    public init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = FeedType(rawValue: label) ?? .unsupported
    }
}

