//
//  DeliveryViewModel.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/15/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class  DeliveryViewModel: NSObject {
    static let cellIdentifier = "DeliveryCell"
}

extension DeliveryViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        Deliveries
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryViewModel.cellIdentifier, for: indexPath) as! DeliveryCell
        cell.imgVwDelvry.image = #imageLiteral(resourceName: "NoImage")
        cell.lblDelvryTitle.text = "Delivery - \(indexPath.row)"
        // Configure the cell...
        
        return cell
    }
}
