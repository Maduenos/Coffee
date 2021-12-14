//
//  CoffeeModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation

struct CoffeeModel: Codable {
    var _id: String
    var name: String
    var extras: [String]?
    var sizes: [String]?
}
