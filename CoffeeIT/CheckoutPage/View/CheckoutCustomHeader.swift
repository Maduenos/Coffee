//
//  CheckoutCustomHeader.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit

class CheckoutCustomHeader: UILabel {
    
    func setDesign () {
        text = "Overview"
        textColor = .black
        font = UIFont(name: Fonts.mainRegular, size: 23)!
    }
    
    func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 20).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -20).isActive = true
        topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    init(parent: UIView) {
        super.init(frame: .zero)
        
        parent.addSubview(self)
        setDesign()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
