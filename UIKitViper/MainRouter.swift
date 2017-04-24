//
//  MainRouter.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 21/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

protocol MainRouterInterface: StackItem {
    
    func openModule(withData data: Any)
    
}

class MainRouter: UITabBarController, MainRouterInterface {
    
    weak var router: MainRouterInterface?
    
    func openModule(withData data: Any){
        
        let modalModule = ModalModuleManager.assembleModule(withData: data)
        (modalModule as? StackItem)?.router = self
        
        present(modalModule, animated: true)
        
    }
    
}
