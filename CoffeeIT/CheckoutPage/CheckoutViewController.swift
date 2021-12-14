//
//  CheckoutViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit

class CheckoutViewController: CustomViewController {

    var checkoutCells: [CheckoutCellViewModel] = []
    var customHeader: CheckoutCustomHeader?
    var checkoutCollectionView: CheckoutCollectionView?
    var finalizeButton: CustomButton?
    var viewControllers: [UIViewController]?
    var checkoutViewModel = CheckoutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startHeader()
        defineControllers()
        startCheckoutColelctionView()
        configureDismiss()
        setFinilizeButton()
    }
    
    func startHeader () {
        customHeader = CheckoutCustomHeader(parent: view)
    }
    
    func defineControllers () {
        viewControllers = navigationController!.viewControllers
    }
    
    func startCheckoutColelctionView () {
        checkoutViewModel.cellsConfgured.sink { [weak self] checkoutCells in
            self?.checkoutCollectionView = CheckoutCollectionView(self!.view, checkoutCells)
        }.store(in: &cancellables)
        
        checkoutViewModel.configureCheckoutModel()
    }
    
    func configureDismiss () {
        checkoutCollectionView?.editClicked.sink(receiveValue: { [weak self] category in
            self?.popController()
            self?.checkoutViewModel.checkControllers(type: category, controllers: self?.viewControllers ?? [])
        }).store(in: &cancellables)
    }
    
    func popController () {
        self.checkoutViewModel.controllerFound.sink { [weak self] controller in
            self?.navigationController!.popToViewController(controller, animated: true)
        }.store(in: &cancellables)
    }
    
    func setFinilizeButton () {
        finalizeButton = CustomButton(parent: view, title: "Brew your coffee")
    }
    
    @objc override func closeController () {
        for aViewController in viewControllers ?? [] {
            if aViewController is MainViewController {
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
    }
    
}
