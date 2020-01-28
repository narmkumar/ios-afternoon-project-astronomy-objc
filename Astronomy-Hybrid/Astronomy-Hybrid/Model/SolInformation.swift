//
//  SolInfo.swift
//  Astronomy-Hybrid
//
//  Created by Niranjan Kumar on 1/28/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

import Foundation

@objc class SolInformation: NSObject {
    @objc let id: Int
    @objc let sol: Int
    @objc let imageURL: URL
    
    @objc init(id: Int, sol: Int, imageURL: URL) {
        self.id = id
        self.sol = sol
        self.imageURL = imageURL
    }
    
    @objc init?(with dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? Int,
            let sol = dictionary["sol"] as? Int,
            let imageString = dictionary["img_src"] as? String,
            let imageURL = URL(string: imageString) else {
            return nil
        }
        
        self.id = id
        self.sol = sol
        self.imageURL = imageURL
        super.init()
    }
}
