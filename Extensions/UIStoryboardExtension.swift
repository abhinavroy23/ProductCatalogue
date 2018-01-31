//
//  UIStoryboardExtension.swift
//  ProductCatalogue
//
//  Created by Abhinav Roy on 31/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

extension UIStoryboard{
    
    class public func main() -> UIStoryboard {
        return self.init(name: "Main", bundle: nil)
    }
    
}
