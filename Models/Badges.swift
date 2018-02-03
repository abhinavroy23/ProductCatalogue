//
//  Badges.swift
//
//  Created by Abhinav Roy on 01/02/18
//  Copyright (c) Abhinav Roy. All rights reserved.
//

import Foundation

public final class Badges:NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let title = "title"
        static let imageUrl = "image_url"
    }
    
    // MARK: Properties
    public var title: String?
    public var imageUrl: String?
    
    init(title: String?, imageUrl: String?){
        self.title = title
        self.imageUrl = imageUrl
    }

}

extension Badges: Decodable{
    
    enum  BadgesSerializationKeys: String, CodingKey{
        case title = "title"
        case imageUrl = "image_url"
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BadgesSerializationKeys.self)
        
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        
        self.init(title: title, imageUrl: imageUrl)
    }
}
