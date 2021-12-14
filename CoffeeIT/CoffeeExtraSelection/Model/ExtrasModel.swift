//
//  ExtrasModel.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation

struct ExtrasModel: Codable {
    var _id: String
    var name: String
    var subselections: [SubselectionModel]?
}

struct SubselectionModel: Codable {
    var _id: String
    var name: String
}
