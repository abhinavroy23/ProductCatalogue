//
//  Status.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Status:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let errorCode = "error_code"
        static let message = "message"
    }
    
    // MARK: Properties
    public var errorCode: Int?
    public var message: String?

    init(errorCode: Int?,message: String?) {
        self.errorCode = errorCode
        self.message = message
    }
}

extension Status:Decodable{
    
    enum StatusSerializationKeys:String,CodingKey {
        case errorCode = "error_code"
        case message = "message"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StatusSerializationKeys.self)
        
        let errorCode = try container.decodeIfPresent(Int.self, forKey: .errorCode)
        let message = try container.decodeIfPresent(String.self, forKey: .message)
        
        self.init(errorCode: errorCode, message: message)
    }
    
}
