//
//  MenuCustomView.swift
//  ReusableViewWithButton
//
//  Created by Nayem on 9/24/17.
//  Copyright © 2017 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class MenuCustomView: UIView {
    
    var shouldUpdateConstraints = true
    
    var saveButton: UIButton!
    var shareButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /*
         settingsButton = UIButton(type: .system)
         let buttonFrame = CGRect(x: self.frame.size.width/2 - 40, y: self.frame.size.height/2 - 40, width: 80, height: 80)
         settingsButton.frame = buttonFrame
         settingsButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
         settingsButton.addTarget(self, action: #selector(settingsButtonAction(sender:)), for: .touchUpInside)
         */
        
        self.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        saveButton = UIButton(type: .system)
        let saveButtonFrame = CGRect(x: self.frame.size.width/2 - 20, y: self.frame.size.height/2 - 15, width: 40, height: 30)
        saveButton.frame = saveButtonFrame
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        saveButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        saveButton.addTarget(self, action: #selector(saveButtonAction(sender:)), for: .touchUpInside)
        
        shareButton = UIButton(type: .system)
        let shareButtonFrame = CGRect(x: saveButton.frame.origin.x, y: saveButton.frame.maxY, width: 40, height: 40)
        shareButton.frame = shareButtonFrame
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        shareButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        shareButton.addTarget(self, action: #selector(shareButtonAction(sender:)), for: .touchUpInside)
        
        self.addSubview(saveButton)
        self.addSubview(shareButton)
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
    
    @objc func saveButtonAction(sender: UIButton!) {
        print("Save button tapped")
    }
    @objc func shareButtonAction(sender: UIButton!) {
        print("Share button tapped")
    }
}
