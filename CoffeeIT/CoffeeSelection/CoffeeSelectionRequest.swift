//
//  CoffeeSelectionRequest.swift
//  CoffeeIT
//
//  Created by Mahammad on 9.12.2021.
//

import Foundation
import Combine

extension CoffeeSelectionViewController {
    
    func getCoffeeData () {
        let endpoint = "\(Endpoints.coffees.rawValue)\(Machines.Lex.rawValue)"
        
        HttpService.shared.getData(endpoint: endpoint, type: CoffeeDetailsModel.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.loadingIndicator?.removeLoadingIndicator()
                    print("Error occured: \(error.localizedDescription)")
                case .finished :
                    print("Done")
                }
            } receiveValue: { [weak self] coffeeData in
                CoffeeModelStorage._id = coffeeData._id
                CoffeeModelStorage.sizes = coffeeData.sizes
                CoffeeModelStorage.extras = coffeeData.extras
                
                self?.startCoffeeCollectionView(coffeeData)
            }
            .store(in: &cancellables)
    }
    
    func startCoffeeCollectionView (_ data: CoffeeDetailsModel) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let coffeeModelData = data.types.map { coffeModel in
                return CoffeeCellViewModel(coffeeDetails: coffeModel)
            }
            
            self?.startCollectionViewInMainThread(coffeeModelData)
        }
    }
    
    func startCollectionViewInMainThread (_ coffeeModelData: [CoffeeCellViewModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let controllerView = self?.view else { return }
            
            self?.loadingIndicator?.removeLoadingIndicator()
            self?.coffeeCollectionView = CoffeeCollectionView(passedParentView: controllerView, coffeeModelData)
            self?.listenCoffeeSelected()
        }
    }
    
    func listenCoffeeSelected () {
        coffeeCollectionView?.coffeeSelected.sink(receiveValue: { [weak self] selectedCoffee in
            let coffeeSizeSelectionController = CoffeeSizeViewController()
            
            coffeeSizeSelectionController.selectedCoffee = selectedCoffee
            
            self?.navigationController?.pushViewController(coffeeSizeSelectionController, animated: true)
        }).store(in: &cancellables)
    }
    
}
