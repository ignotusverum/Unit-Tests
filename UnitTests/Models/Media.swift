//
//  Media.swift
//  UnitTests
//
//  Created by Vlad Z. on 6/4/20.
//  Copyright © 2020 Octo Ent. All rights reserved.
//

public enum MediaType: String, Codable, Equatable {
    case mp4
    case image
    case largeImage = "image_large"
    case unsupported
    
    public init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = MediaType(rawValue: label) ?? .unsupported
    }
}

public struct Media: Codable, Equatable {
    public let id: String
    public let src: String
    public let type: MediaType
}

