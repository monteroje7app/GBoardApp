//
//  KpiCellStyle.swift
//  GBoardApp
//
//  Created by Dev2 on 03/06/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class KpiCellStyle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
    // Make it card-like
    layer.cornerRadius = 10
    layer.shadowOpacity = 1
    layer.shadowRadius = 2
    layer.shadowColor = UIColor(named: "Orange")?.cgColor
    layer.shadowOffset = CGSize(width: 3, height: 3)
    backgroundColor = UIColor(named: "Red")
    }
}
