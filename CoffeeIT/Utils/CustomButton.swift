//
//  CustomButton.swift
//  CoffeeIT
//
//  Created by Mahammad on 10.12.2021.
//

import Combine
import UIKit

class CustomButton: UIButton {
    
    var title: String
    var isClicked = PassthroughSubject<Void, Never>()
    
    func setButtonTitle () {
        setTitle(title, for: .normal)
    }
    
    @available(iOS 15.0, *)
    private func addConfgurations () {
        var config = UIButton.Configuration.filled()
        var attText = AttributedString.init(title)
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        config.baseBackgroundColor = Colors.mainGreen
        
        attText.font = UIFont(name: Fonts.mainBold, size: 18)
        config.attributedTitle = attText
        
        configuration = config
    }
    
    private func setDesign () {
        backgroundColor = Colors.mainGreen
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.cornerRadius = 4
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: Fonts.mainBold, size: 18)
        contentHorizontalAlignment = .leading
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    private func setConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 20).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -20).isActive = true
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    func listenClickEvent () {
        addTarget(self, action: #selector(sendClickEvent), for: .touchUpInside)
    }
    
    @objc func sendClickEvent () {
        isClicked.send()
    }
    
    init(parent: UIView, title: String) {
        self.title = title
        
        super.init(frame: .zero)
        
        parent.addSubview(self)
        
        setDesign()
        
        if #available(iOS 15.0, *) {
            addConfgurations()
        } else {
            setButtonTitle()
            
        }
        setConstraints()
        listenClickEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
