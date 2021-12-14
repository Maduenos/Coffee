//
//  ExtrasCellViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

struct ExtrasCellViewModel {
    
    var currentExtraModel: ExtrasModel?
    
    var _id: String!
    var name: String!
    var subselections: [SubselectionModel]?
    var image: String?
    var imageWidth: CGFloat!
    
    init (_ coffeeModel: String) {
        getExtrasProps(coffeeModel)
        
        self._id = currentExtraModel?._id ?? ""
        self.subselections = currentExtraModel?.subselections
        
        getNameAndImage()
        
        self.imageWidth = (image?.count ?? 0) > 0 ? 0.55 : 0
    }
    
    mutating func getExtrasProps (_ id: String) {
        currentExtraModel = CoffeeModelStorage.extras?.first(where: { sizeModel in
            sizeModel._id == id
        })
    }
    
    mutating func getNameAndImage () {
        if (_id == ExtraTypeIDs.Milk.rawValue) {
            image = "Milk"
            name = "Milk"
        } else if (_id == ExtraTypeIDs.Sugar.rawValue) {
            image = "Sugar"
            name = "Sugar"
        } else {
            image = ""
            name = currentExtraModel?.name
        }
    }
    
}
