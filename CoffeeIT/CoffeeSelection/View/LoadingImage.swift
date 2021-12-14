//
//  LoadingImage.swift
//  CoffeeIT
//
//  Created by Mahammad on 11.12.2021.
//

import UIKit

class LoadingImage: UIImageView {
    
    func addLoadingIndicator () {
        setGIFImage(name: "coffLoad")
    }
    
    func removeLoadingIndicator () {
        stopAnimating()
        removeFromSuperview()
    }
    
    private func loadingIndicatorConstraints () {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true
        widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    init(parent: UIView) {
        super.init(frame: .zero)
        
        parent.addSubview(self)
        
        addLoadingIndicator()
        loadingIndicatorConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
