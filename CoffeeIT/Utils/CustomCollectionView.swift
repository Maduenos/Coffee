//
//  CustomCollectionView.swift
//  CoffeeIT
//
//  Created by Mahammad on 8.12.2021.
//

import UIKit

class CustomCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let sectionHeader = "SectionHeader"
    var headerLabelText: String?
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionHeader, for: indexPath) as? SectionHeader{
            sectionHeader.label.text = headerLabelText

            return sectionHeader
        }

        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: Constants.cellHeight)
    }
    
    @objc func refreshCollectionView () {
        collectionView.reloadData()
    }
    
    func addToParent (_ parent: UIView) {
        parent.addSubview(self)
        
        constraintsSet()
    }
    
    func setDesign () {
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.cornerRadius = 5
        
    }
    
    func adjustcollectionViewProperties () {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func constraintsSet() {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
    }
    
    func registerCell () {}
    
    deinit {
        collectionView.dataSource = nil
        collectionView.delegate = nil
        collectionView.removeFromSuperview()
    }
    
    init(parent: UIView) {
        super.init(frame: .zero)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        
        parent.addSubview(self)
        addSubview(collectionView)
        
        registerCell()
        constraintsSet()
        adjustcollectionViewProperties()
        setDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
