//
//  KpiTableViewCell2TableViewCell.swift
//  GBoardApp
//
//  Created by Dev2 on 03/06/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class KpiTableViewCell2: UITableViewCell {
    
    @IBOutlet weak var viewKpiCell: UIView!
    @IBOutlet weak var lblKpiValue: UILabel!
    @IBOutlet weak var lblKpiTitle: UILabel!
    @IBOutlet weak var lblKpiFocus: UILabel!
    @IBOutlet weak var lblKpiMin: UILabel!
    
    @IBOutlet weak var lblKpiMax: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configure(value: Kpi)  {
        viewKpiCell.backgroundColor = value.color()
        lblKpiValue.text = String(value.kpiValue)
        lblKpiFocus.text =  value.kpiFocus.rawValue
        lblKpiMax.text = String(value.kpiVmax)
        lblKpiMin.text = String(value.kpiVmin)
        lblKpiTitle.text = value.kpiTitle
        
        
    }
    
    
}
