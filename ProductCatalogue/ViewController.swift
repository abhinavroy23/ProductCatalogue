//
//  ViewController.swift
//  ProductCatalogue
//
//  Created by Abhinav Roy on 31/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: Network
extension ViewController{
    
    func hitServiceToFetchData(forLat lat : String, andLong long:String, withCompletionHandler completion : @escaping ()->(), andErrorHandler errorHandler:@escaping (_ error : Error)->()){
        
        let headerDic : [String : String] = [
            "user-key" : UrlConstant.zomationUserkey
        ]
        let urlString = UrlConstant.getRestrauntsUrlBasedOn(lat: lat, long: long)
        
        SessionServiceManager.sharedSessionServiceManger.sendRequest(forUrl: urlString, dataToSend: nil, cookies: false, requestType: "GET", contentType: .eRequestJsonType, headers: headerDic , withCompletionHandler: { [unowned self] (data) in
            do{
                self.searchResults = try JSONDecoder().decode(SearchResult.self, from: data!)
                completion()
            }catch{
                errorHandler(error)
            }
        }) { (error) in
            errorHandler(error!)
        }
    }
    
}


