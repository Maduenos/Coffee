//
//  CheckoutSubcategory.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit

class CheckoutSubcategory: CoffeeExtrasSubcategories {
    
    override func setSubcategoryWrapperConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: 30).isActive = true
        rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: -30).isActive = true
        heightAnchor.constraint(equalTo: superview!.heightAnchor, multiplier: 0.5).isActive = true
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
    }
    
    override func setSubcategoryWrapperDesign () {
        backgroundColor = Colors.darkerGreen
        layer.cornerRadius = 7
        alpha = 1
        isUserInteractionEnabled = true
    }
    
    override func addTapOn () {}
    
    override func setSelectionTickDesign () {
        subcategorySelectionTick.alpha = 1
    }
    
}
