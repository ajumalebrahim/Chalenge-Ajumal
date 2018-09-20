//
//  DeliveryServices.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/20/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import Foundation
import Alamofire

protocol DeliveryServiceDelgate {
    func apiCompleted(modelArry : [DeliverySevice])
}

struct DeliverySevice {
    var id: Int
    var description: String
    var imageUrl: String
    init(_ dictionary: [String: Any]) {
        self.id = dictionary["id"] as? Int ?? 0
        self.description = dictionary["description"] as? String ?? ""
        self.imageUrl = dictionary["imageUrl"]  as? String ?? ""
    }
}


class DeliveryServices: NSObject {
    var delegate : DeliveryServiceDelgate?
    
    func getDeliveries() {
        Alamofire.request(APPURL.Deliveries, method: .get, parameters: nil).responseJSON { (response) in
            if let json = response.result.value {
                guard let jsonArray = json as? [[String: Any]] else {
                    return
                }
                var model = [DeliverySevice]()
                model = jsonArray.compactMap(DeliverySevice.init)
                self.delegate?.apiCompleted(modelArry: model)
            }
        }
    }
}
