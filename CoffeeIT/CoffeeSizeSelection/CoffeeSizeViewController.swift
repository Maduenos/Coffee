//
//  CoffeeSizeViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit
import Combine

class CoffeeSizeViewController: CustomViewController {
    
    var selectedCoffee: CoffeeCellViewModel?
    var sizeCollectionView: CoffeeSizeCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
     
        startSizeCollectionView()
        listenCoffeeSelected()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UserSelections().reset(.CoffeeExtra)
    }
    
    func startSizeCollectionView () {
        let sizeCellModelArray = selectedCoffee?.sizes?.map({ size in
            CoffeeSizesCellViewModel(size)
        })
        
        sizeCollectionView = CoffeeSizeCollectionView(passedParentView: view, sizeCellModelArray ?? [])
    }
    
    func listenCoffeeSelected () {
        sizeCollectionView?.sizeSelected.sink(receiveValue: { [weak self] _ in
            let coffeeSizeSelectionController = CoffeeExtraViewController()
            
            coffeeSizeSelectionController.selectedCoffee = self?.selectedCoffee
            
            self?.navigationController?.pushViewController(coffeeSizeSelectionController, animated: true)
        }).store(in: &cancellables)
    }

}
