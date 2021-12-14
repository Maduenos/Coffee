//
//  EditButtonViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import Combine
import UIKit

struct CheckoutViewModel {
    
    var checkoutCells: [CheckoutCellViewModel] = []
    var controllerFound = PassthroughSubject<UIViewController, Never>()
    var cellsConfgured = PassthroughSubject<[CheckoutCellViewModel], Never>()
    
    func checkControllers (type: CheckoutCellCategories, controllers: [UIViewController]) {
        for aViewController in controllers {
            if type == .CoffeeSize && aViewController is CoffeeSizeViewController ||
                type == .CoffeeType && aViewController is CoffeeSelectionViewController ||
                type == .CoffeeExtra && aViewController is CoffeeExtraViewController {
                    controllerFound.send(aViewController)
            }
        }
    }
    
    mutating func configureCheckoutModel () {
        checkoutCells.append(CheckoutCellViewModel(category: .CoffeeType))
        checkoutCells.append(CheckoutCellViewModel(category: .CoffeeSize))
        
        for currentExtra in UserSelections.extras {
            checkoutCells.append(CheckoutCellViewModel(category: .CoffeeExtra,
                                                       which: currentExtra))
            
            for subcategory in (currentExtra.subselections ?? []) {
                checkoutCells.append(CheckoutCellViewModel(category: .CoffeeSubcategory,
                                                           which: currentExtra,
                                                           child: subcategory))
            }
        }
        
        checkoutCells[checkoutCells.count - 1].bottomLineAlpha = 0
        cellsConfgured.send(checkoutCells)
    }
    
}
