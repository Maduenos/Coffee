//
//  CoffeeExtrasSubcategories.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation
import UIKit

class CoffeeExtrasSubcategories: UIView {
    
    var row: Int
    var subselection: SubselectionModel
    var categoryName: String
    var extraModel: ExtrasModel
    var isSelected: Bool = false
    let subcategoryLabel = UILabel()
    let subcategorySelectionBorder = UIImageView(image: UIImage(named: "TickBorder"))
    let subcategorySelectionTick = UIImageView(image: UIImage(named: "Tick"))
    
    private func addSubviews () {
        addSubview(subcategoryLabel)
        addSubview(subcategorySelectionBorder)
        addSubview(subcategorySelectionTick)
    }
    
    func setSubcategoryWrapperDesign () {
        backgroundColor = Colors.darkerGreen
        layer.cornerRadius = 7
        alpha = 0
        isUserInteractionEnabled = true
    }
    
    func setSubcategoryWrapperConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: 15).isActive = true
        rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: -15).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: CGFloat(-20 + (-70 * row))).isActive = true
    }
    
    private func setSubcategoryLabelText () {
        subcategoryLabel.text = categoryName
        subcategoryLabel.textColor = .white
        subcategoryLabel.font = UIFont(name: Fonts.mainMedium, size: 16.0)!
    }
    
    private func setSubcategoryLabelConstraints () {
        subcategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        subcategoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        subcategoryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        subcategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subcategoryLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setSelectionBorder () {
        subcategorySelectionBorder.translatesAutoresizingMaskIntoConstraints = false
        subcategorySelectionBorder.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        subcategorySelectionBorder.widthAnchor.constraint(equalToConstant: 30).isActive = true
        subcategorySelectionBorder.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subcategorySelectionBorder.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setSelectionTickDesign () {
        subcategorySelectionTick.alpha = 0
    }
    
    private func setSelectionTick () {
        subcategorySelectionTick.translatesAutoresizingMaskIntoConstraints = false
        subcategorySelectionTick.centerXAnchor.constraint(equalTo: subcategorySelectionBorder.centerXAnchor).isActive = true
        subcategorySelectionTick.widthAnchor.constraint(equalToConstant: 15).isActive = true
        subcategorySelectionTick.heightAnchor.constraint(equalToConstant: 15).isActive = true
        subcategorySelectionTick.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func addTapOn () {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tickListener))
        addGestureRecognizer(tap)
    }
    
    @objc private func tickListener () {
        deactivateTicks()
        toggleSubcategory()
        removeExistingExtra()
        addExtraData()
    }
    
    private func deactivateTicks () {
        for subview in superview!.subviews {
            if (type(of: subview) == CoffeeExtrasSubcategories.self && subview != self) {
                (subview as! CoffeeExtrasSubcategories).subcategorySelectionTick.alpha = 0
                (subview as! CoffeeExtrasSubcategories).isSelected = false
            }
        }
    }
    
    private func toggleSubcategory () {
        subcategorySelectionTick.alpha = isSelected ? 0 : 1
        
        isSelected = !isSelected
    }
    
    private func removeExistingExtra () {
        UserSelections.extras.removeAll(where: { model in
            model._id == extraModel._id
        })
    }
    
    private func addExtraData () {
        if (!isSelected) {
            return
        }
        
        UserSelections.extras.append(ExtrasModel(_id: extraModel._id,
                                                 name: extraModel.name,
                                                 subselections: [subselection]))
    }
    
    init(_ parent: UIView, _ extra: ExtrasModel, _ subselection: SubselectionModel, _ row: Int? = 0) {
        self.row = row ?? 0
        self.extraModel = extra
        self.subselection = subselection
        self.categoryName = subselection.name
        
        super.init(frame: .zero)
        
        parent.addSubview(self)
        addSubviews()
        
        setSubcategoryWrapperDesign()
        setSubcategoryWrapperConstraints()
        setSubcategoryLabelText()
        setSubcategoryLabelConstraints()
        
        setSelectionBorder()
        
        setSelectionTickDesign()
        setSelectionTick()
        
        addTapOn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
