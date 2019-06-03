//
//  Kpi.swift
//  GBoardApp
//
//  Created by Dev2 on 29/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import Foundation
import UIKit


struct Kpi {
    
    let kpiTitle: String
    let kpiDescription: String
    let kpiVmax: Double
    let kpiVmin: Double
    let kpiValue: Double 
    
    
    let kpiFocus: FocusType
    
    
    static var kpiCount: Int = 3
    
    
    
    
    func  kpiVyellow() -> Double {
        return (self.kpiVmax - self.kpiVmin)/3
    }
    
    func  kpiVred() -> Double {
        return 2*(self.kpiVmax - self.kpiVmin)/3
    }
    
    func color() -> UIColor {
        
        switch self.kpiValue {
            case kpiVred()...kpiVmax:
                return UIColor.red
            case kpiVyellow()..<kpiVred():
                return UIColor.yellow
            default:
                return UIColor.green
            }
    }
    
}
