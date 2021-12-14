//
//  EditSelectionButton.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import UIKit
import Combine

class EditSelectionButton : UIButton {
    
    var isClicked = PassthroughSubject<Void, Never>()
    
    func setDesign () {
        backgroundColor = .clear
        setTitle("Edit", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: Fonts.mainMedium, size: 15)
    }
    
    func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -20).isActive = true
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
    }
    
    func listenClickEvent () {
        addTarget(self, action: #selector(sendClickEvent), for: .touchUpInside)
    }
    
    @objc func sendClickEvent () {
        isClicked.send()
    }
    
    init(parent: UIView) {
        super.init(frame: .zero)
        
        parent.addSubview(self)
        
        setDesign()
        setConstraints()
        listenClickEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
