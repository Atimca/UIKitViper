//
//  SubTabPresenter.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

protocol SubTabPresenterInput: class {
    
    func buttonDidTriggered()
    
}

class SubTabPresenter: UIViewController, SubTabPresenterInput, StackItem {
    
    // MARK: - Properties
    
    var internalView: SubTabViewInterface?
    var interactor: SubTabInteractorInterface?
    weak var router: MainRouterInterface?
    
    // MARK: - Lifecircle
    
    override func viewDidLoad() {
        internalView?.setupView(onMainView: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        interactor?.didObtainData() { result in
            
            DispatchQueue.main.async {
                self.internalView?.updateView(withData: result)
            }
            
        }
        
    }
    
    // MARK: - TabPresenterInput
    
    func buttonDidTriggered() {
        router?.openModule(withData: 0)
    }
    
}
