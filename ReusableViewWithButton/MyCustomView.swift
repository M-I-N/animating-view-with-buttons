//
//  MyCustomView.swift
//  ReusableViewWithButton
//
//  Created by Nayem on 9/22/17.
//  Copyright © 2017 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    var shouldUpdateConstraints = true
    
    var settingsButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsButton = UIButton(type: .system)
        let buttonFrame = CGRect(x: self.frame.size.width/2 - 40, y: self.frame.size.height/2 - 40, width: 80, height: 80)
        settingsButton.frame = buttonFrame
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
    }
}
