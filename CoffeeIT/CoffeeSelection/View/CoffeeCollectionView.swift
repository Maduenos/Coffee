//
//  CoffeeCollectionView.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Combine
import UIKit

class CoffeeCollectionView: CustomCollectionView {
    
    private let coffeeCellIdentifier = "coffeeCellIdentifier"
    private var coffees : [CoffeeCellViewModel]
    
    public var coffeeSelected = PassthroughSubject<CoffeeCellViewModel, Never>()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffees.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: coffeeCellIdentifier, for: indexPath) as! CoffeeCollectionViewCell
        let currentCoffee = coffees[indexPath.row]
        
        cell.coffeeViewModel = currentCoffee
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coffeeSelected.send(coffees[indexPath.row])
        
        UserSelections._id = coffees[indexPath.row]._id
        UserSelections.name = coffees[indexPath.row].name
    }
    
    override func registerCell () {
        collectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: coffeeCellIdentifier)
    }
    
    init(passedParentView: UIView, _ data: [CoffeeCellViewModel]) {
        coffees = data
        
        super.init(parent: passedParentView)
        
        headerLabelText = Constants.TypeCollectionViewHeader
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
