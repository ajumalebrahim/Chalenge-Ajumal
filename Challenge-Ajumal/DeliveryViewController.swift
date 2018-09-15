//
//  DeliveryViewController.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/15/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController, UITableViewDelegate {
    
    private var deliveryTableView: UITableView!
    
    let viewModel = DeliveryViewModel()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Things to Deliver"
        setUpTableView()
        deliveryTableView.dataSource = viewModel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private
    
    func setUpTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        deliveryTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        deliveryTableView.register(UITableViewCell.self, forCellReuseIdentifier: DeliveryViewModel.cellIdentifier)
        deliveryTableView.delegate = self
        self.view.addSubview(deliveryTableView)
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
