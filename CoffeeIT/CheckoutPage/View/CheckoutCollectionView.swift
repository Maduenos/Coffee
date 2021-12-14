//
//  CheckoutCollectionView.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit
import Combine

class CheckoutCollectionView: CustomCollectionView {
    
    private let checkoutCategoryCell = "checkoutCategoryCell"
    private let checkoutSubcategoryCell = "checkoutSubcategoryCell"
    
    private var selectedRow : Int?
    private var checkoutCells : [CheckoutCellViewModel]
    var editClicked = PassthroughSubject<CheckoutCellCategories, Never>()
    var cancelable = Set<AnyCancellable>()
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: frame.width, height: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return checkoutCells.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: checkoutCategoryCell, for: indexPath) as! CheckoutCollectionViewCell
        let subcategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: checkoutSubcategoryCell, for: indexPath) as! CheckoutSubcategoryCollectionViewCell
        let currentCell = checkoutCells[indexPath.row].isSubcategory ? subcategoryCell : cell
        
        currentCell.coffeeCheckoutData = checkoutCells[indexPath.row]
        
        listenEditClick(currentCell)
        
        return currentCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: Constants.cellHeight)
    }
    
    func listenEditClick (_ cell: CustomCollectionViewCell) {
        cell.isClicked.sink { [weak self] category in
            self?.editClicked.send(category)
        }.store(in: &cancelable)
    }
    
    override func adjustcollectionViewProperties () {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func constraintsSet() {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.cellHeight).isActive = true
    }
    
    override func registerCell () {
        collectionView.register(CheckoutCollectionViewCell.self, forCellWithReuseIdentifier: checkoutCategoryCell)
        collectionView.register(CheckoutSubcategoryCollectionViewCell.self, forCellWithReuseIdentifier: checkoutSubcategoryCell)
    }
    
    func setBackgroundColor () {
        collectionView.backgroundColor = Colors.mainGreen
        collectionView.layer.cornerRadius = 3
        collectionView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        collectionView.layer.shadowRadius = 4
        collectionView.layer.shadowOpacity = 1
        collectionView.layer.shadowOffset = .zero
    }
    
    init(_ passedParentView: UIView, _ checkoutCells: [CheckoutCellViewModel]) {
        self.checkoutCells = checkoutCells
        
        super.init(parent: passedParentView)
    
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
