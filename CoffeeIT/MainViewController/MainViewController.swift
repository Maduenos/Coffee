//
//  ViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 8.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var machineImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adjustNavigationBar()
        addClickOnImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startMachineAnimation()
    }

}

