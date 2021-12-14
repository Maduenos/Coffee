//
//  CustomViewController.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import UIKit
import Combine

class CustomViewController: UIViewController {
    
    var cancellables = Set<AnyCancellable>()
    let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        viewDesign()
        adjustNavigationBar()
        addBackButtonEvent()
    }
    
    func viewDesign () {
        view.backgroundColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func adjustNavigationBar () {
        backButton.setImage(UIImage(named: "BackButton"), for: .normal)
        backButton.setTitle("Brew with Lex", for: .normal)
        backButton.imageView?.transform3D = CATransform3DMakeScale(0.7, 0.7, 0.7)
        backButton.sizeToFit()
        backButton.titleLabel?.font = UIFont(name: Fonts.mainBold, size: 16.0)!
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func addBackButtonEvent () {
        backButton.addTarget(self, action: #selector(closeController), for: .touchUpInside)
    }
    
    @objc func closeController () {
        self.navigationController?.popViewController(animated: true)
    }
    
}
