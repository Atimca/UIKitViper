//
//  TabModuleManager.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

class TabModuleManager {
    
    class func assembleTabModule(withIndex index: Int) -> TabRouter {
        
        let router = TabRouter()
        let presenter = assemblePresenter(withIndex: index)
        presenter.router = router
        
        router.viewControllers = [presenter]
        
        return router
    }
    
    private class func assemblePresenter(withIndex index: Int) -> TabPresenter {
        
        let presenter = TabPresenter()
        let interactor = TabInteractor()
        let view = TabView()
        
        presenter.internalView = view
        presenter.interactor = interactor
        presenter.title = "item \(index)"
        
        view.presenter = presenter
        
        return presenter
    }
    
}
