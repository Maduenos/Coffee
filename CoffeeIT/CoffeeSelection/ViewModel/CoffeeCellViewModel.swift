//
//  CoffeeViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

struct CoffeeCellViewModel {
    
    var _id: String
    var name: String
    var extras: [String]?
    var sizes: [String]?
    var image: String
    var imageWidth: CGFloat!
    
    init (coffeeDetails: CoffeeModel) {
        self._id = coffeeDetails._id
        self.name = coffeeDetails.name
        self.extras = coffeeDetails.extras
        self.sizes = coffeeDetails.sizes
        self.image = coffeeDetails.name
        self.imageWidth = image.count > 0 ? 0.55 : 0
    }
    
}
