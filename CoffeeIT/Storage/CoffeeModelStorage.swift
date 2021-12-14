//
//  CoffeeModelStorage.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation

struct CoffeeModelStorage {
    
    static var _id: String? = nil
    static var extras: [ExtrasModel]? = nil
    static var sizes: [SizesModel]? = nil
    
}

struct UserSelections {
    
    static var _id: String? = nil
    static var name: String? = nil
    static var extras: [ExtrasModel] = []
    static var size: SizesModel? = nil
    
    func reset (_ data: CheckoutCellCategories) {
        switch data {
        case .CoffeeType:
            UserSelections._id = nil
            UserSelections.name = nil
        case .CoffeeSize:
            UserSelections.size = nil
        case .CoffeeExtra:
            UserSelections.extras = []
        case .CoffeeSubcategory:
            break
        }
    }
    
}
