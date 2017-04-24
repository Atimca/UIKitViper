//
//  ModalPresenter.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

protocol ModalPresenterInput: class {
    
    func buttonDidTriggered()
    
}

class ModalPresenter: UIViewController, ModalPresenterInput, StackItem {
    
    // MARK: - Properties
    
    var internalView: ModalViewInterface?
    var interactor: ModalInteractorInterface?
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
        dismiss(animated: true)
    }
    
}
