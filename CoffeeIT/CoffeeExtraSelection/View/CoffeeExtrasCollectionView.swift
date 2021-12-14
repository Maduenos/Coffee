//
//  CoffeeExtrasCollectionView.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit
import Combine

class CoffeeExtrasCollectionView : CustomCollectionView {
    
    private let extraCollectionViewCell = "extraCollectionViewCell"
    private var selectedRow : Int?
    private var coffeeSizes : [ExtrasCellViewModel]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeSizes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: extraCollectionViewCell, for: indexPath) as! CoffeeExtrasCollectionViewCell
        let currentCoffee = coffeeSizes[indexPath.row]
        
        cell.coffeeExtraViewModel = currentCoffee
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentExtrasCount = coffeeSizes[indexPath.row].subselections?.count ?? 0
        let heightPerExtra = 80
        let addedHeight : CGFloat = CGFloat(Int(Constants.cellHeight) + currentExtrasCount * heightPerExtra)
        
        if (selectedRow == indexPath.row) {
            return CGSize(width: frame.width, height: addedHeight)
        }
        
        return CGSize(width: frame.width, height: Constants.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selectedRow == indexPath.row) {
            selectedRow = nil
        } else {
            selectedRow = indexPath.row
        }
        
        animateColectionViewCells()
    }
    
    func animateColectionViewCells () {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            self?.collectionView.performBatchUpdates({}, completion: nil)
        }, completion: nil)
    }
    
    override func constraintsSet() {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -90).isActive = true
    }
    
    override func registerCell () {
        collectionView.register(CoffeeExtrasCollectionViewCell.self, forCellWithReuseIdentifier: extraCollectionViewCell)
    }
    
    init(_ passedParentView: UIView, _ data: [ExtrasCellViewModel]) {
        coffeeSizes = data
        
        super.init(parent: passedParentView)
        
        headerLabelText = Constants.ExtrasCollectionViewHeader
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
