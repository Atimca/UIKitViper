//
//  TabView.swift
//  UIKitViper
//
//  Created by Smirnov Maxim on 24/04/2017.
//  Copyright © 2017 Finch. All rights reserved.
//

import UIKit

protocol TabViewInterface: class {
    
    func setupView(onMainView view: UIView)
    func updateView(withData data: Any)
    
}

class TabView: UIView, TabViewInterface {
    
    // MARK: - Properties
    private var textLabel: UILabel?
    weak var presenter: TabPresenterInput?
    
    // MARK: - TabViewInterface
    
    func setupView(onMainView view: UIView) {
        
        view.addSubview(self)
        frame = view.frame
        
        backgroundColor = .lightGray
        
        let textLabel = UILabel(frame: .init(origin: .init(x: 100, y: 80.0), size: .init(width: frame.width / 2.0, height: 40.0)))
        addSubview(textLabel)
        self.textLabel = textLabel
        
        let button = UIButton(frame: .init(origin: .init(x: 100, y: 120.0), size: .init(width: frame.width / 2.0, height: 40.0)))
        addSubview(button)
        button.setTitle("tapButton", for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let extraButton = UIButton(frame: .init(origin: .init(x: 100, y: 200.0), size: .init(width: frame.width / 2.0, height: 40.0)))
        addSubview(extraButton)
        extraButton.setTitle("extraButton", for: .normal)
        
        extraButton.addTarget(self, action: #selector(extraButtonAction), for: .touchUpInside)
        
    }
    
    func updateView(withData data: Any) {
        
        guard let text = data as? String else {
            return
        }
        
        textLabel?.text = text

    }
    
    // MARK: - Actions
    
    func buttonAction() {
        presenter?.buttonDidTriggered()
    }
    
    func extraButtonAction() {
        presenter?.extraButtonDidTriggered()
    }
    
}
