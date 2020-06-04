//
//  FeedListSection.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public enum FeedSectionType: String, Codable, Equatable {
    case top
    case banner
    case featured
    case evergreen
    case unsupported
    
    public init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = FeedSectionType(rawValue: label) ?? .unsupported
    }
}

public struct FeedListSection: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case index
        case items
        case maxStatic = "max_static"
        case maxRotating = "max_rotating"
    }
    
    public var id: String
    
    public var maxStatic: Int
    public var maxRotating: Int
    
    public var index: Int
    public var type: FeedSectionType
    public var items: [FeedSectionItem]
}

public extension FeedListSection {
    var visibleItems: [FeedSectionItem] {
        let staticItems = items
            .filter { !$0.isRotating }
            .prefix(maxStatic)
        
        let rotatingItems = items
            .filter { $0.isRotating }
            .shuffled()
            .prefix(maxRotating)
        
        return Array(staticItems + rotatingItems)
    }
}
import Foundation
