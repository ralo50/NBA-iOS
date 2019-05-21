//
//  CollectionViewCell.swift
//  NBA new
//
//  Created by Luka on 4/12/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let homeImageView: UIImage = {
        let image = UIImage()
        return image
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViewComponents() {
        
    }
}
