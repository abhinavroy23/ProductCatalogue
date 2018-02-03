//
//  Labels.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Labels:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let title = "title"
        static let color = "color"
    }
    
    // MARK: Properties
    public var title: String?
    public var color: String?
    
    init(title: String?,color: String?) {
        self.title = title
        self.color = color
    }
}

extension Labels:Decodable{
    
    enum LabelsSerializationKeys:String,CodingKey {
        case title = "title"
        case color = "color"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LabelsSerializationKeys.self)
        
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let color = try container.decodeIfPresent(String.self, forKey: .color)
        
        self.init(title: title, color: color)
    }
    
}
