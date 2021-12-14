//
//  CheckoutCellViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit

struct CheckoutCellViewModel {
    
    var bottomLineAlpha: CGFloat
    var isSubcategory: Bool
    var relatedExtra: String?
    var name: String
    var image: String
    var category: CheckoutCellCategories
    
    private var extra: ExtrasModel?
    private var sub: SubselectionModel?
    
    init(category: CheckoutCellCategories, which extra: ExtrasModel? = nil, child sub: SubselectionModel? = nil) {
        self.category = category
        self.isSubcategory = false
        self.name = ""
        self.image = ""
        self.extra = extra
        self.sub = sub
        self.bottomLineAlpha = 1
        
        collectData()
    }
    
    mutating func collectData () {
        switch category {
        case .CoffeeType:
            setCoffeeTypeData()
        case .CoffeeSize:
            setCoffeeSizeData()
        case .CoffeeExtra:
            setCoffeeExtra()
        case .CoffeeSubcategory:
            setIsSubcategory()
            setSubcategoryProps()
        }
    }
    
    mutating func setCoffeeTypeData () {
        name = UserSelections.name ?? ""
        image = UserSelections.name ?? ""
    }
    
    mutating func setCoffeeSizeData () {
        name = UserSelections.size?.name ?? ""
        image = UserSelections.size?.name ?? ""
    }
    
    mutating func setCoffeeExtra () {
        if (extra?._id == ExtraTypeIDs.Milk.rawValue) {
            image = "Milk"
            name = "Milk"
        } else if (extra?._id == ExtraTypeIDs.Sugar.rawValue) {
            image = "Sugar"
            name = "Sugar"
        } else {
            image = ""
            name = extra?.name ?? ""
        }
    }
    
    mutating func setIsSubcategory () {
        isSubcategory = true
    }
    
    mutating func setSubcategoryProps () {
        relatedExtra = extra?.name
        name = sub?.name ?? ""
    }
    
}
