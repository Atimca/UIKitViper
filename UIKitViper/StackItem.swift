//
//  StackItem.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

protocol StackItem: class {
    
    weak var router: MainRouterInterface? { get set }
    
}
