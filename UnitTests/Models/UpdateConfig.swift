//
//  UpdateConfig.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public enum UpdateAlertType {
    case force(config: UpdateConfig)
    case soft(config: UpdateConfig)
    
    var priority: Int {
        switch self {
        case .force: return 0
        case .soft: return 1
        }
    }
}

public struct UpdateConfig: Decodable {
    public var force: Bool
    
    public var minVersion: String?
    public var maxVersion: String?
    
    public var title: String
    public var description: String
    
    public var actions: [UpdateConfigActions]
}

public enum UpdateConfigActionsType: String, Decodable {
    case cancel
    case custom
    case appStore = "app-store"
}

public struct UpdateConfigActions: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case path
    }
    
    public var path: String?
    public var title: String
    public var type: UpdateConfigActionsType?
}
