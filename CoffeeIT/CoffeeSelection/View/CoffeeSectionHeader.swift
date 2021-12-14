//
//  CoffeeSectionHeader.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    let label = UILabel()
    
    func labelDesign  () {
        label.textColor = .black
        label.font = UIFont(name: Fonts.mainRegular, size: 23)!
    }
    
    func addConstraintsLabel () {
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        labelDesign()
        addConstraintsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
