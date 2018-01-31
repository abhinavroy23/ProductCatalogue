//
//  Constant.swift
//  ProductCatalogue
//
//  Created by Abhinav Roy on 31/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class Constant: NSObject {
    
    //MARK: Screen size constants
    static let SCREEN_WIDTH : CGFloat = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT : CGFloat = UIScreen.main.bounds.size.height
    static let IS_IPAD = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)

}
