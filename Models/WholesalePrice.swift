//
//  WholesalePrice.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class WholesalePrice:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let countMin = "count_min"
        static let countMax = "count_max"
        static let price = "price"
    }
    
    // MARK: Properties
    public var countMin: Int?
    public var countMax: Int?
    public var price: String?
    
    init(countMin: Int?,countMax: Int?,price: String?) {
        self.countMin = countMin
        self.countMax = countMax
        self.price = price
    }
}

extension WholesalePrice:Decodable{

    enum WholesalePriceSerializationKeys:String,CodingKey {
        case countMin = "count_min"
        case countMax = "count_max"
        case price = "price"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WholesalePriceSerializationKeys.self)
        
        let countMin = try container.decodeIfPresent(Int.self, forKey: .countMin)
        let countMax = try container.decodeIfPresent(Int.self, forKey: .countMax)
        let price = try container.decodeIfPresent(String.self, forKey: .price)
        
        self.init(countMin: countMin, countMax: countMax, price: price)
    }
    
}
