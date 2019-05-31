//
//  KpiTableViewCell.swift
//  GBoardApp
//
//  Created by Dev2 on 31/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class KpiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblKpiValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(value: Double) {
        return lblKpiValue.text = String(value)
    }
   

}
