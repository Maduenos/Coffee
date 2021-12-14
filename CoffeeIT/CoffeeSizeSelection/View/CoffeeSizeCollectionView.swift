//
//  CoffeeSizeCollectionView.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit
import Combine

class CoffeeSizeCollectionView: CustomCollectionView {
    
    private let sizeCollectionViewCell = "sizeCollectionViewCell"
    private var coffeeSizes : [CoffeeSizesCellViewModel]
    
    public var sizeSelected = PassthroughSubject<Void, Never>()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeSizes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sizeCollectionViewCell, for: indexPath) as! CoffeeSizeCollectionViewCell
        let currentCoffee = coffeeSizes[indexPath.row]
        
        cell.coffeeSizeViewModel = currentCoffee
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sizeSelected.send()
        
        UserSelections.size = coffeeSizes[indexPath.row].currentSizeModel
    }
    
    override func registerCell () {
        collectionView.register(CoffeeSizeCollectionViewCell.self, forCellWithReuseIdentifier: sizeCollectionViewCell)
    }
    
    init(passedParentView: UIView, _ data: [CoffeeSizesCellViewModel]) {
        coffeeSizes = data
        
        super.init(parent: passedParentView)
        
        headerLabelText = Constants.SizesCollectionViewHeader
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
