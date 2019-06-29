//
//  HomeCellView.swift
//  FuelBarTestApp
//
//  Created by Sherman Shi on 6/20/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class HomeCellView: UICollectionViewCell {
    
    // MARK: - Properties
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Acai"
        label.font = UIFont(name: "Helvetica", size: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        addSubview(textLabel)
        textLabel.anchorwithConstant(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
    }
    
}
