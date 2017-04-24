//
//  MainModuleManager.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

class MainModuleManager {
    
    class func assembleMainRouter() -> UIViewController {
        
        let router = MainRouter()
        
        var itemModules: [UIViewController] = []
        
        for i in 0...3 {
            
            let tabRouter = TabModuleManager.assembleTabModule(withIndex: i)
            tabRouter.router = router
            
            let tabItem = UITabBarItem(title: "Item \(i)", image: nil, tag: i)
            tabRouter.tabBarItem = tabItem
            
            itemModules.append(tabRouter)
            
        }

        router.viewControllers = itemModules
        
        return router
    }
    
}
