//
//  CheckoutModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import Foundation

struct CheckoutModel: Codable {
    var _id: String
    var name: String
    var extras: [String]?
    var size: String
}
