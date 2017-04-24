//
//  ModalModuleManager.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

class ModalModuleManager {
    
    class func assembleModule(withData data: Any) -> UIViewController {
        
        let presenter = ModalPresenter()
        let interactor = ModalInteractor()
        let view = ModalView()
        
        presenter.internalView = view
        presenter.interactor = interactor
        presenter.title = "item \(data as? String ?? "")"
        
        view.presenter = presenter
        
        return presenter
    }
    
}
