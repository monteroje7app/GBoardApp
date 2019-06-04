//
//  ViewController.swift
//  GBoardApp
//
//  Created by Dev2 on 29/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class KpiViewController: UIViewController {
    
    @IBOutlet weak var tblKpi: UITableView!
    
    @IBOutlet weak var viewFocusFilters: UIView!
    
    // Temp KPIS for test
    
    let kpiFirst = Kpi(kpiTitle: "Ventas", kpiDescription: "Meta de Ventas del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 75.0, kpiFocus: .financial)
    let kpiSecond = Kpi(kpiTitle: "Compras", kpiDescription: "Meta de Compras del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 34, kpiFocus: .customer)
    let kpiThird = Kpi(kpiTitle: "Rechazos", kpiDescription: "Meta de Rechazos del Mes", kpiVmax: 100.0, kpiVmin: 0.0, kpiValue: 2, kpiFocus: .growth)
    
    
    var allKpiArray : [Kpi] = []
    
    let kpiSearcher = UISearchController(searchResultsController: nil)
    var kpiFiltered: [Kpi] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblKpi.delegate = self
        tblKpi.dataSource = self
        
        
        allKpiArray = [kpiFirst, kpiSecond, kpiThird]
        
        tblKpi.tableHeaderView = viewFocusFilters
        
        debugPrint("Primer KPI \(kpiFirst.kpiDescription)")
        
        // Setup the Search Controller
        kpiSearcher.searchResultsUpdater = self
        kpiSearcher.obscuresBackgroundDuringPresentation = false
        tblKpi.tableHeaderView = kpiSearcher.searchBar
        
       
    }
    
    
    
    
    deinit {
        
        debugPrint("Me muerooooo KpiViewController ☠️")
    }
    
    
    func kpiFilter(_ searchText: String, scope: String = "All") -> [Kpi] {
        return allKpiArray.filter { (kpiTexto) -> Bool in
            kpiTexto.kpiTitle.lowercased().hasPrefix(searchText.lowercased())
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        return kpiSearcher.searchBar.text?.isEmpty ?? true
    }
    
    
}


//  Extensions

extension KpiViewController: UITableViewDelegate {
    
    
}

extension KpiViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if searchBarIsEmpty() {
            return allKpiArray.count
        } else {
            return kpiFiltered.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "KpiTableViewCellIdentifier"
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if let kpiTableViewCell = tableViewCell as? KpiTableViewCell2
        {
            
            var kpiValueSpec : Kpi!
            if searchBarIsEmpty() {
                kpiValueSpec = allKpiArray[indexPath.row]
            } else {
                kpiValueSpec = kpiFiltered[indexPath.row]
            }
            kpiTableViewCell.configure(value: kpiValueSpec)
            
            
            return kpiTableViewCell
        }
        
        return tableViewCell!
        
        
    }
    
    
}

extension  KpiViewController:  UISearchResultsUpdating  {
    
    func updateSearchResults(for searchController: UISearchController) {
        debugPrint("Se ha presionado")
        
        let textToFind = searchController.searchBar.text!
        kpiFiltered = kpiFilter(textToFind)
        
        tblKpi.reloadData()
    }
    
    
}

extension KpiViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        kpiFilter(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
}
