//
//  Shop.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Shop:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let isGold = "is_gold"
        static let reputationImageUri = "reputation_image_uri"
        static let location = "location"
        static let shopLucky = "shop_lucky"
        static let id = "id"
        static let city = "city"
        static let name = "name"
        static let uri = "uri"
    }
    
    // MARK: Properties
    public var isGold: Int?
    public var reputationImageUri: String?
    public var location: String?
    public var shopLucky: String?
    public var id: Int?
    public var city: String?
    public var name: String?
    public var uri: String?
    
    init(isGold: Int?,reputationImageUri: String?,location: String?,shopLucky: String?,id: Int?,city: String?,name: String?,uri: String?) {
        self.isGold = isGold
        self.reputationImageUri = reputationImageUri
        self.location = location
        self.shopLucky = shopLucky
        self.id = id
        self.city = city
        self.name = name
        self.uri = uri
    }
}

extension Shop:Decodable{
    
    enum ShopSerializationKeys:String,CodingKey {
        case isGold = "is_gold"
        case reputationImageUri = "reputation_image_uri"
        case location = "location"
        case shopLucky = "shop_lucky"
        case id = "id"
        case city = "city"
        case name = "name"
        case uri = "uri"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShopSerializationKeys.self)
        
        let isGold = try container.decodeIfPresent(Int.self, forKey: .isGold)
        let reputationImageUri = try container.decodeIfPresent(String.self, forKey: .reputationImageUri)
        let location = try container.decodeIfPresent(String.self, forKey: .location)
        let shopLucky = try container.decodeIfPresent(String.self, forKey: .shopLucky)
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let city = try container.decodeIfPresent(String.self, forKey: .city)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let uri = try container.decodeIfPresent(String.self, forKey: .uri)
        
        self.init(isGold: isGold, reputationImageUri: reputationImageUri, location: location, shopLucky: shopLucky, id: id, city: city, name: name, uri: uri)
    }
    
}
