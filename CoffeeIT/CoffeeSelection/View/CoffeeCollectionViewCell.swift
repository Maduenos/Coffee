//
//  CoffeeCollectionViewCell.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation
import UIKit

class CoffeeCollectionViewCell : CustomCollectionViewCell {
    
    var coffeeViewModel: CoffeeCellViewModel? {
        didSet {
            coffeeLabel.text = coffeeViewModel?.name
            coffeeImage.image = UIImage(named: coffeeViewModel?.image ?? "")
            
            setImageConstraints()
        }
    }
    
    private func setImageConstraints () {
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        coffeeImage.leftAnchor.constraint(equalTo: greenWrapper.leftAnchor, constant: 25).isActive = true
        coffeeImage.heightAnchor.constraint(equalTo: greenWrapper.heightAnchor, multiplier: coffeeViewModel?.imageWidth ?? 0).isActive = true
        coffeeImage.widthAnchor.constraint(equalTo: coffeeImage.heightAnchor).isActive = true
        coffeeImage.centerYAnchor.constraint(equalTo: greenWrapper.centerYAnchor).isActive = true
    }
    
}
