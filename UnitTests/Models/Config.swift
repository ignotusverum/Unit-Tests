//
//  Config.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

import Foundation

public struct Config: Decodable {
    public var id: String
    public var feeds: [FeedConfig]
    public var updates: [UpdateConfig]?
}
