//
//  ProductData.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class ProductData:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let departmentId = "department_id"
        static let labels = "labels"
        static let name = "name"
        static let uri = "uri"
        static let countReview = "count_review"
        static let badges = "badges"
        static let isFeatured = "is_featured"
        static let imageUri = "image_uri"
        static let rating = "rating"
        static let condition = "condition"
        static let price = "price"
        static let countTalk = "count_talk"
        static let id = "id"
        static let shop = "shop"
        static let originalPrice = "original_price"
        static let wholesalePrice = "wholesale_price"
        static let discountPercentage = "discount_percentage"
        static let preorder = "preorder"
        static let imageUri700 = "image_uri_700"
        static let countSold = "count_sold"
    }
    
    // MARK: Properties
    public var departmentId: Int?
    public var labels: [Labels]?
    public var name: String?
    public var uri: String?
    public var countReview: Int?
    public var badges: [Badges]?
    public var isFeatured: Int?
    public var imageUri: String?
    public var rating: Int?
    public var condition: Int?
    public var price: String?
    public var countTalk: Int?
    public var id: Int?
    public var shop: Shop?
    public var originalPrice: String?
    public var wholesalePrice: [WholesalePrice]?
    public var discountPercentage: Int?
    public var preorder: Int?
    public var imageUri700: String?
    public var countSold: Int?
    
    init(departmentId: Int?,labels: [Labels]?,name: String?,uri: String?,countReview: Int?,badges: [Badges]?,isFeatured: Int?,imageUri: String?,rating: Int?,condition: Int?,price: String?,countTalk: Int?,id: Int?,shop: Shop?,originalPrice: String?,wholesalePrice: [WholesalePrice]?,discountPercentage: Int?,preorder: Int?,imageUri700: String?,countSold: Int?) {
        
        self.departmentId = departmentId
        self.labels = labels
        self.name = name
        self.uri = uri
        self.countReview = countReview
        self.badges = badges
        self.isFeatured = isFeatured
        self.imageUri = imageUri
        self.rating = rating
        self.condition = condition
        self.price = price
        self.countTalk = countTalk
        self.id = id
        self.shop = shop
        self.originalPrice = originalPrice
        self.wholesalePrice = wholesalePrice
        self.discountPercentage = discountPercentage
        self.preorder = preorder
        self.imageUri700 = imageUri700
        self.countSold = countSold
        
    }
}

extension ProductData: Decodable{
    
    enum ProductDataSerializationKeys: String,CodingKey{
        case departmentId = "department_id"
        case labels = "labels"
        case name = "name"
        case url = "uri"
        case countReview = "count_review"
        case badges = "badges"
        case isFeatured = "is_featured"
        case imageUri = "image_uri"
        case rating = "rating"
        case condition = "condition"
        case price = "price"
        case countTalk = "count_talk"
        case id = "id"
        case shop = "shop"
        case originalPrice = "original_price"
        case wholesalePrice = "wholesale_price"
        case discountPercentage = "discount_percentage"
        case preorder = "preorder"
        case imageUri700 = "image_uri_700"
        case countSold = "count_sold"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductDataSerializationKeys.self)
        
        let departmentId = try container.decodeIfPresent(Int.self, forKey: .departmentId)
        let labels = try container.decodeIfPresent([Labels].self, forKey: .labels)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let uri = try container.decodeIfPresent(String.self, forKey: .url)
        let countReview = try container.decodeIfPresent(Int.self, forKey: .countReview)
        let badges = try container.decodeIfPresent([Badges].self, forKey: .badges)
        let isFeatured = try container.decodeIfPresent(Int.self, forKey: .isFeatured)
        let imageUri = try container.decodeIfPresent(String.self, forKey: .imageUri)
        let rating = try container.decodeIfPresent(Int.self, forKey: .rating)
        let condition = try container.decodeIfPresent(Int.self, forKey: .condition)
        let price = try container.decodeIfPresent(String.self, forKey: .price)
        let countTalk = try container.decodeIfPresent(Int.self, forKey: .countTalk)
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let shop = try container.decodeIfPresent(Shop.self, forKey: .shop)
        let originalPrice = try container.decodeIfPresent(String.self, forKey: .originalPrice)
        let wholesalePrice = try container.decodeIfPresent([WholesalePrice].self, forKey: .wholesalePrice)
        let discountPercentage = try container.decodeIfPresent(Int.self, forKey: .discountPercentage)
        let preorder = try container.decodeIfPresent(Int.self, forKey: .preorder)
        let imageUri700 = try container.decodeIfPresent(String.self, forKey: .imageUri700)
        let countSold = try container.decodeIfPresent(Int.self, forKey: .countSold)
        
        self.init(departmentId: departmentId, labels: labels, name: name, uri: uri, countReview: countReview, badges: badges, isFeatured: isFeatured, imageUri: imageUri, rating: rating, condition: condition, price: price, countTalk: countTalk, id: id, shop: shop, originalPrice: originalPrice, wholesalePrice: wholesalePrice, discountPercentage: discountPercentage, preorder: preorder, imageUri700: imageUri700, countSold: countSold)
    }
    
}
