//
//  SetupViewController.swift
//  GBoardApp
//
//  Created by Dev2 on 05/06/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var btnUpdatePressed: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func btnUpdatePressed(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "Update KPI", message: "Updating KPI Values form Server", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
              
              
            }}))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


