//
//  MainViewControllerConfigs.swift
//  CoffeeIT
//
//  Created by Mahammad on 11.12.2021.
//

import UIKit

extension MainViewController {
    
    func startMachineAnimation () {
        _ = MachineImageAnimator.init(mainImage: machineImage)
    }
    
    func adjustNavigationBar () {
        let button = UIButton(type: .system)
        button.setTitle("Dark Roasted Beans", for: .normal)
        button.sizeToFit()
        button.titleLabel?.font = UIFont(name: Fonts.mainBold, size: 16.0)!
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func addClickOnImage () {
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(startCoffeesPage))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapEvent)
    }
    
    @objc func startCoffeesPage () {
        let coffeeSelectionController = CoffeeSelectionViewController()
        
        self.navigationController?.pushViewController(coffeeSelectionController, animated: true)
    }
    
}
