//
//  CheckoutSubcategoryCollectionViewCell.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit

class CheckoutSubcategoryCollectionViewCell : CustomCollectionViewCell {
    
    override var coffeeCheckoutData: CheckoutCellViewModel? {
        didSet {
            coffeeLabel.text = coffeeCheckoutData?.name
            coffeeImage.image = UIImage(named: "")
            
            setImageConstraints()
            addSubCategories()
            deviderDesign()
        }
    }
    
    private func setImageConstraints () {
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        coffeeImage.leftAnchor.constraint(equalTo: greenWrapper.leftAnchor, constant: 25).isActive = true
        coffeeImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
        coffeeImage.widthAnchor.constraint(equalTo: coffeeImage.heightAnchor).isActive = true
        coffeeImage.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
    }
    
    private func addSubCategories () {
        _ = CheckoutSubcategory(greenWrapper,
                                ExtrasModel(_id: "",
                                            name: coffeeCheckoutData!.relatedExtra ?? "",
                                            subselections: []),
                                SubselectionModel(_id: "",
                                                  name: coffeeCheckoutData!.name)
        )
    }
    
    override func setGreenViewDesign () {
        greenWrapper.backgroundColor = Colors.mainGreen
    }
    
    override func deviderDesign () {
        devider.backgroundColor = .white
        devider.alpha = coffeeCheckoutData?.bottomLineAlpha ?? 1
    }
    
    override func deviderConstraints () {
        devider.translatesAutoresizingMaskIntoConstraints = false
        devider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        devider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        devider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        devider.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
    }
    
}
