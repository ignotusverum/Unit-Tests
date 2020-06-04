//
//  FeedList.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public struct FeedList: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case index
        case sections
    }
    
    public var id: String
    
    public var index: Int
    public var type: FeedType
    public var sections: [FeedListSection]
}

