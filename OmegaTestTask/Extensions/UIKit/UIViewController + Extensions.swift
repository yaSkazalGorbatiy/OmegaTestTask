//
//  UIViewController + Extensions.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 03.10.2021.
//

import UIKit

extension UIViewController {
    
    func createCustomButton(selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}

