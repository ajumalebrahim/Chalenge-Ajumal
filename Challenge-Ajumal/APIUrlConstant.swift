//
//  APIUrlConstant.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/20/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import Foundation

struct APPURL {
    private struct Domains {
        static let Dev = "https://mock-api-mobile.dev.lalamove.com/"
        static let Live = "https://mock-api-mobile.dev.lalamove.com/"
    }
    private  static let BaseURL = Domains.Dev
    
    static var Deliveries: String {
        return BaseURL + "deliveries"
    }
}


