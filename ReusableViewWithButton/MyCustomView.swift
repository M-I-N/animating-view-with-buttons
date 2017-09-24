//
//  MyCustomView.swift
//  ReusableViewWithButton
//
//  Created by Nayem on 9/22/17.
//  Copyright © 2017 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

protocol MyCustomViewProtocol: class {
    func myCustomView(_ myCustomView: MyCustomView, didTapButton button: UIButton, shouldReturnView menuCustomView: MenuCustomView) -> Void
}

class MyCustomView: UIView {
    
    weak var delegate: MyCustomViewProtocol?
    
    var shouldUpdateConstraints = true
    
    var settingsButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        settingsButton = UIButton(type: .system)
        let buttonFrame = CGRect(x: self.bounds.size.width - 80, y: self.bounds.origin.y, width: 80, height: 40)
        settingsButton.frame = buttonFrame
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        settingsButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        settingsButton.addTarget(self, action: #selector(settingsButtonAction(sender:)), for: .touchUpInside)
        
        self.addSubview(settingsButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if shouldUpdateConstraints {
            // Auto Layout Constraints
            shouldUpdateConstraints = false
        }
        super.updateConstraints()
    }
    
    
    @objc func settingsButtonAction(sender: UIButton!) -> Void {
        print("Settings Button Tapped")
        // Generate a view that should be passed to the reciever
        let menuViewFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let menuView = MenuCustomView(frame: menuViewFrame)
        if let delegate = delegate {
            delegate.myCustomView(self, didTapButton: sender, shouldReturnView: menuView)
        }
    }
}
