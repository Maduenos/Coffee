//
//  CoffeeExtrasCollectionViewCell.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

class CoffeeExtrasCollectionViewCell : CustomCollectionViewCell {
    
    var cellIsOpen : Bool = false
    
    var coffeeExtraViewModel: ExtrasCellViewModel? {
        didSet {
            coffeeLabel.text = coffeeExtraViewModel?.name
            coffeeImage.image = UIImage(named: coffeeExtraViewModel?.image ?? "")
            
            setImageConstraints()
            addSubCategories()
        }
    }
    
    private func setImageConstraints () {
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        coffeeImage.leftAnchor.constraint(equalTo: greenWrapper.leftAnchor, constant: 25).isActive = true
        coffeeImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coffeeImage.widthAnchor.constraint(equalTo: coffeeImage.heightAnchor).isActive = true
        coffeeImage.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
    }
    
    private func addSubCategories () {
        for (index, category) in (coffeeExtraViewModel?.subselections ?? []).enumerated() {
            guard let extrasModel = coffeeExtraViewModel?.currentExtraModel else { return }
            
            let subcategoryWrapper = CoffeeExtrasSubcategories(greenWrapper, extrasModel, category, index)
            
            subcategoryWrapper.tag = index + 1
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if (!cellIsOpen && isSelected) {
                cellIsOpen = !cellIsOpen
                
                animateSubcategories(isVisible: true)
            } else if (cellIsOpen) {
                cellIsOpen = !cellIsOpen
                
                animateSubcategories(isVisible: false)
            }
        }
    }
    
    private func animateSubcategories (isVisible: Bool) {
        let customAlpha: CGFloat = isVisible ? 1 : 0
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            guard let _ = self else { return }
            
            self!.devider.alpha = customAlpha
            
            for subview in self!.greenWrapper.subviews {
                if (subview.tag > 0) {
                    subview.alpha = customAlpha
                }
            }
        }, completion: nil)
    }
    
}
