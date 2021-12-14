//
//  CoffeeSizesCellViewModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

struct CoffeeSizesCellViewModel {
    
    var currentSizeModel: SizesModel?
    
    var _id: String!
    var name: String!
    var __v: Int?
    var image: String?
    var imageWidth: CGFloat!
    
    init (_ coffeeModel: String) {
        getSizeProps(coffeeModel)
        
        self._id = currentSizeModel?._id ?? ""
        self.name = currentSizeModel?.name ?? ""
        self.__v = currentSizeModel?.__v
        self.image = currentSizeModel?.name ?? ""
        self.imageWidth = (image?.count ?? 0) > 0 ? 0.55 : 0
    }
    
    mutating func getSizeProps (_ id: String) {
        currentSizeModel = CoffeeModelStorage.sizes?.first(where: { sizeModel in
            sizeModel._id == id
        })
    }
    
}
