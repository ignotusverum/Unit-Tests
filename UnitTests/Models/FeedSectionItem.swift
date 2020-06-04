//
//  FeedSectionItem.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public struct FeedSectionItem: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case id
        case cta
        case index
        case title
        case section
        case filters
        case isRotating
    }
    
    public var id: String
    public var filters: String
    
    public var cta: String
    public var title: String
    public var isRotating: Bool
    
    public var index: Int
    public var section: String
}

