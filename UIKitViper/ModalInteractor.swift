//
//  ModalInteractor.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import Foundation

protocol ModalInteractorInterface: class {
    
    func didObtainData(complitionHandler: ((Any) -> ())?)
    
}

class ModalInteractor: ModalInteractorInterface {
    
    // MARK: - TabInteractorInterface
    
    func didObtainData(complitionHandler: ((Any) -> ())?) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            complitionHandler?("random text \(arc4random() % 100)")
        }
        
    }
    
}
