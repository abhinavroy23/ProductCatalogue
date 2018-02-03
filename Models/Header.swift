//
//  Header.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Header:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let totalData = "total_data"
        static let processTime = "process_time"
        static let additionalParams = "additional_params"
        static let totalDataNoCategory = "total_data_no_category"
    }
    
    // MARK: Properties
    public var totalData: Int?
    public var processTime: Float?
    public var additionalParams: String?
    public var totalDataNoCategory: Int?
    
    init(totalData: Int?,processTime: Float?,additionalParams: String?,totalDataNoCategory: Int?) {
        self.totalData = totalData
        self.processTime = processTime
        self.additionalParams = additionalParams
        self.totalDataNoCategory = totalDataNoCategory
    }
}

extension Header:Decodable{
    
    enum HeaderSerializationKeys:String,CodingKey {
        case totalData = "total_data"
        case processTime = "process_time"
        case additionalParams = "additional_params"
        case totalDataNoCategory = "total_data_no_category"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HeaderSerializationKeys.self)
        
        let totalData = try container.decodeIfPresent(Int.self, forKey: .totalData)
        let processTime = try container.decodeIfPresent(Float.self, forKey: .processTime)
        let additionalParams = try container.decodeIfPresent(String.self, forKey: .additionalParams)
        let totalDataNoCategory = try container.decodeIfPresent(Int.self, forKey: .totalDataNoCategory)
        
        self.init(totalData: totalData, processTime: processTime, additionalParams: additionalParams, totalDataNoCategory: totalDataNoCategory)
    }
}
