//
//  FeedItemBanner.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public struct FeedItemBanner: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case type
        case index
        case htmlDescription = "html_description"
        case cta
        case section
        case path
        case medias
    }
    
    public var id: String
    public var cta: String
    public var path: String
    
    public var index: Int
    
    public var title: String
    public var displayTitle: String {
        return title
            .uppercased()
    }
    
    public var type: FeedType
    
    public var section: String
    public var sectionType: FeedItemSectionType {
        return FeedItemSectionType(rawValue: section) ?? .none
    }
    
    public var htmlDescription: String
    
    public var medias: [Media]
    
    public func getFirstMedia(type: MediaType) -> Media? {
        return medias.filter({ $0.type == type }).first
    }
}
