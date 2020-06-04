//
//  Feed.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public enum Gender: String, Codable, Equatable {
    case men
    case women
}

public struct Feed: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case id
        case items
        case gender
    }
    
    public var id: String
    public var gender: Gender
    public var items: [FeedItem]
}
