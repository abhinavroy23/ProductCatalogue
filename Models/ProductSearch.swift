//
//  ProductSearch.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class ProductSearch:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let status = "status"
        static let data = "data"
        static let header = "header"
    }
    
    // MARK: Properties
    public var status: Status?
    public var data: [ProductData]?
    public var header: Header?
    
    public init(status: Status?,data: [ProductData]?,header: Header?) {
        self.status = status
        self.data = data
        self.header = header
    }
    
}

extension ProductSearch:Decodable{
    
    enum ProductSearchSerializationKeys:String,CodingKey {
        case status = "status"
        case data = "data"
        case header = "header"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductSearchSerializationKeys.self)
        
        let status = try container.decodeIfPresent(Status.self, forKey: .status)
        let data = try container.decodeIfPresent([ProductData].self, forKey: .data)
        let header = try container.decodeIfPresent(Header.self, forKey: .header)
        
        self.init(status: status, data: data, header: header)
    }
    
    
}
