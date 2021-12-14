//
//  MachineImageViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 8.12.2021.
//

import Foundation
import UIKit

class MachineImageAnimator {
    
    weak var mainImage: UIView?
    
    init (mainImage: UIView) {
        self.mainImage = mainImage
        
        addInitialParameters()
        addShadow()
    }
    
    private func addInitialParameters () {
        self.mainImage?.layer.shadowColor = UIColor.systemGreen.cgColor
        self.mainImage?.layer.shadowOffset = .zero
        self.mainImage?.layer.shadowRadius = 5
        self.mainImage?.layer.shadowOpacity = 0
    }
    
    private func addShadow () {
        UIView.animate(withDuration: 0.7,
                       delay: 1,
                       options: [.repeat, .autoreverse],
                       animations: { [weak self] in
            self?.mainImage?.layer.shadowOpacity = 0.4
        }, completion: nil)
    }
    
}
