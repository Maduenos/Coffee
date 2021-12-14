//
//  CommonColectionViewCell.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Combine
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var isClicked = PassthroughSubject<CheckoutCellCategories, Never>()
    let greenWrapper: UIView = UIView()
    let coffeeImage: UIImageView = UIImageView()
    let coffeeLabel: UILabel = UILabel()
    var devider : UIView = UIView()
    
    var coffeeCheckoutData: CheckoutCellViewModel?
    
    private func addSubviews () {
        addSubview(greenWrapper)
        addSubview(devider)
        greenWrapper.addSubview(coffeeImage)
        greenWrapper.addSubview(coffeeLabel)
    }
    
    func setGreenViewDesign () {
        greenWrapper.backgroundColor = Colors.mainGreen
        greenWrapper.layer.cornerRadius = 3
        greenWrapper.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        greenWrapper.layer.shadowRadius = 2
        greenWrapper.layer.shadowOpacity = 1
        greenWrapper.layer.shadowOffset = .zero
    }
    
    func deviderDesign () {
        devider.backgroundColor = .white
        devider.alpha = 0
    }
    
    func deviderConstraints () {
        devider.translatesAutoresizingMaskIntoConstraints = false
        devider.topAnchor.constraint(equalTo: topAnchor, constant: 98).isActive = true
        devider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        devider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        devider.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
    }
    
    private func setGreenViewConstraints () {
        greenWrapper.translatesAutoresizingMaskIntoConstraints = false
        greenWrapper.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        greenWrapper.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        greenWrapper.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        greenWrapper.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setLabelDesign () {
        coffeeLabel.textColor = .white
        coffeeLabel.font = UIFont(name: Fonts.mainMedium, size: 16.0)!
    }
    
    private func setCoffeeLabel () {
        coffeeLabel.translatesAutoresizingMaskIntoConstraints = false
        coffeeLabel.leftAnchor.constraint(equalTo: coffeeImage.rightAnchor, constant: 20).isActive = true
        coffeeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coffeeLabel.widthAnchor.constraint(equalTo: greenWrapper.widthAnchor, multiplier: 0.5).isActive = true
        coffeeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setGreenViewDesign()
        setGreenViewConstraints()
        deviderDesign()
        deviderConstraints()
        setLabelDesign()
        setCoffeeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
