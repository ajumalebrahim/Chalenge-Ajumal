//
//  DeliveryViewModel.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/15/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import UIKit
import SDWebImage

protocol DeliveryModelDelegate {
    func updateTable()
    func showDetails(deliveryData:DeliverySevice) 
}

class  DeliveryViewModel: NSObject {
    var delegate : DeliveryModelDelegate?
    static let cellIdentifier = "DeliveryCell"
    
    fileprivate var deliveryData = [DeliverySevice]()
    
    func loadData() {
        let api = DeliveryServices()
        api.delegate = self
        api.getDeliveries()
    }
}

extension DeliveryViewModel: DeliveryServiceDelgate {
    func apiCompleted(modelArry: [DeliverySevice]) {
        deliveryData = modelArry
        delegate?.updateTable()
    }
}

extension DeliveryViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deliveryData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryViewModel.cellIdentifier, for: indexPath) as! DeliveryCell
        cell.imgVwDelvry.sd_setImage(with: URL(string: deliveryData[indexPath.row].imageUrl), placeholderImage: #imageLiteral(resourceName: "NoImage"))
        cell.lblDelvryTitle.text = deliveryData[indexPath.row].description
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.showDetails(deliveryData: deliveryData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
