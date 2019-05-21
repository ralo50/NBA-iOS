//
//  SectionHeaderView.swift
//  Nba
//
//  Created by Luka on 3/14/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import Foundation
import UIKit

protocol ChangeDateDelegate {
    func changeDate(day: Int)
}

class SectionHeaderVIew: UICollectionReusableView {    
    
    var delegate: ChangeDateDelegate?
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func dayBefore(_ sender: UIButton) {
        if delegate != nil {
            delegate?.changeDate(day: -1)
        }
    }
    
    @IBAction func dayAfter(_ sender: UIButton) {
        if delegate != nil {
            delegate?.changeDate(day: 1)
        }
    }
}
