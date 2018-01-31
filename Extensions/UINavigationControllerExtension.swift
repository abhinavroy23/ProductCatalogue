//
//  UINavigationControllerExtension.swift
//  ProductCatalogue
//
//  Created by Abhinav Roy on 31/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    func pushViewController(identifier : String, animated : Bool = true){
        self.pushViewController(UIStoryboard.main().instantiateViewController(withIdentifier: identifier), animated: animated)
    }
}
