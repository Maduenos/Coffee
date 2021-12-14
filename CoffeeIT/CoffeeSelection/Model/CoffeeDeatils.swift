//
//  CoffeeDeatils.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation

struct CoffeeDetailsModel: Codable {
    var _id: String
    var extras: [ExtrasModel]
    var sizes: [SizesModel]
    var types: [CoffeeModel]
}
