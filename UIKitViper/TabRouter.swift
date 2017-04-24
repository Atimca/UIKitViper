//
//  TabRouter.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

class TabRouter: UINavigationController, MainRouterInterface {
    
    weak var router: MainRouterInterface?
    
    func openModule(withData data: Any) {
        
        guard let id = data as? Int else {
            return
        }
        
        switch id {
            
        case 0:
            let subTab = SubTabModuleManager.assembleModule(withData: "SubTab")
            (subTab as? StackItem)?.router = self
            
            pushViewController(subTab, animated: true)
            
        case 1:
            router?.openModule(withData: "modal")
            
        default:
            break
            
        }
        
    }
    
}
