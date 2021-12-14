//
//  CoffeeExtraViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit

class CoffeeExtraViewController: CustomViewController {
    
    var selectedCoffee: CoffeeCellViewModel?
    var sizeCollectionView: CoffeeExtrasCollectionView?
    var continueButton: CustomButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        startSizeCollectionView()
        addContinueButton()
        openCheckkoutPage()
    }

    func startSizeCollectionView () {
        let extrasCellModelArray = selectedCoffee?.extras?.map({ extra in
            ExtrasCellViewModel(extra)
        })
        
        sizeCollectionView = CoffeeExtrasCollectionView(view, extrasCellModelArray ?? [])
    }
    
    func addContinueButton () {
        continueButton = CustomButton(parent: view, title: "Continue")
    }
    
    func openCheckkoutPage () {
        continueButton?.isClicked.sink(receiveValue: { [weak self] _ in
            let checkoutController = CheckoutViewController()

            self?.navigationController?.pushViewController(checkoutController, animated: true)
        }).store(in: &cancellables)
    }
    
}
