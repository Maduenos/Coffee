//
//  CoffeeSelectionViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 8.12.2021.
//

import UIKit
import Combine

class CoffeeSelectionViewController: CustomViewController {
    
    var loadingIndicator : LoadingImage?
    var coffeeCollectionView: CoffeeCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        addLoadingIndicator()
        getCoffeeData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UserSelections().reset(.CoffeeSize)
    }
    
    func addLoadingIndicator () {
        loadingIndicator = LoadingImage(parent: view)
    }
    
    func removeLoadingIndicator () {
        loadingIndicator?.stopAnimating()
        loadingIndicator?.removeFromSuperview()
    }

}
