//
//  DeliveryCell.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/20/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import UIKit

class DeliveryCell: UITableViewCell {
    let imgVwDelvry = UIImageView()
    let lblDelvryTitle = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imgVwDelvry.translatesAutoresizingMaskIntoConstraints = false
        lblDelvryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgVwDelvry)
        contentView.addSubview(lblDelvryTitle)
        
        updateLayout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateLayout() {
        let views: [String: Any] = [
            "image": imgVwDelvry,
            "Label": lblDelvryTitle]
        var allConstraints: [NSLayoutConstraint] = []
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-15-[image(50)]",
            metrics: nil,
            views: views)
        allConstraints += iconVerticalConstraints
        
        let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-15-[Label]",
            metrics: nil,
            views: views)
        allConstraints += nameLabelVerticalConstraints
        
        let iconHConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[image(50)]",
            metrics: nil,
            views: views)
        allConstraints += iconHConstraints
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[image(50)]-[Label]-15-|",
            metrics: nil,
            views: views)
        allConstraints += topRowHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
    }

}
