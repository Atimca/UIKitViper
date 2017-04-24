//
//  TabPresenter.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

protocol TabPresenterInput: class {
    
    func buttonDidTriggered()
    func extraButtonDidTriggered()
    
}

class TabPresenter: UIViewController, TabPresenterInput {
    
    // MARK: - Properties
    
    var internalView: TabViewInterface?
    var interactor: TabInteractorInterface?
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
    
    func extraButtonDidTriggered() {
        router?.openModule(withData: 1)
    }
    
}
