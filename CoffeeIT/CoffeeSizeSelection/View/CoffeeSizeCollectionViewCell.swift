//
//  CoffeeSizeCollectionViewCell.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

class CoffeeSizeCollectionViewCell: CustomCollectionViewCell {
    
    var coffeeSizeViewModel: CoffeeSizesCellViewModel? {
        didSet {
            coffeeLabel.text = coffeeSizeViewModel?.name
            coffeeImage.image = UIImage(named: coffeeSizeViewModel?.image ?? "")
            
            setImageConstraints()
        }
    }
    
    private func setImageConstraints () {
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        coffeeImage.leftAnchor.constraint(equalTo: greenWrapper.leftAnchor, constant: 25).isActive = true
        coffeeImage.heightAnchor.constraint(equalTo: greenWrapper.heightAnchor, multiplier: coffeeSizeViewModel?.imageWidth ?? 0).isActive = true
        coffeeImage.widthAnchor.constraint(equalTo: coffeeImage.heightAnchor).isActive = true
        coffeeImage.centerYAnchor.constraint(equalTo: greenWrapper.centerYAnchor).isActive = true
    }
    
}
