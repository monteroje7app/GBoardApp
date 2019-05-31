//
//  ViewController.swift
//  GBoardApp
//
//  Created by Dev2 on 29/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class KpiViewController
: UIViewController {

    @IBOutlet weak var tblKpi: UITableView!
    
    
    let kpiFirst = Kpi(kpiTitle: "Ventas", kpiDescription: "Meta de Ventas del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 75.0, kpiFocus: .financial)
    
    let kpiSecond = Kpi(kpiTitle: "Compras", kpiDescription: "Meta de Compras del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 34, kpiFocus: .customer)
    
    
    let kpiThird = Kpi(kpiTitle: "Rechazos", kpiDescription: "Meta de Rechazos del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 2, kpiFocus: .growth)
    
    var allKpiArray : [Kpi] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblKpi.delegate = self
        tblKpi.dataSource = self
        
        
        allKpiArray = [kpiFirst, kpiSecond, kpiThird]
        
        debugPrint("Primer KPI \(kpiFirst.kpiDescription)")
    }

  

    
    deinit {
        
        debugPrint("Me muerooooo KpiViewController ☠️")
    }
    
}

extension KpiViewController: UITableViewDelegate {
    
}

extension KpiViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return    allKpiArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "KpiTableViewCellIdentifier"
        
      let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId)
      
        if let KpiTableViewCell = tableViewCell as? KpiTableViewCell
    {
            
            let kpiValueSpec = allKpiArray[indexPath.row].kpiValue
        
        KpiTableViewCell.configure(value: kpiValueSpec)
            
        return KpiTableViewCell
        }
        
        return tableViewCell!
        
        
    }
    
    
}

