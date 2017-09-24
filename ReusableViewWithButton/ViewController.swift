//
//  ViewController.swift
//  ReusableViewWithButton
//
//  Created by Nayem on 9/22/17.
//  Copyright © 2017 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuView: MenuCustomView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0.0, y: 20.0, width: self.view.frame.width, height: 200)
        let customView = MyCustomView(frame: frame)
        customView.delegate = self
        self.view.addSubview(customView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: MyCustomViewProtocol {
    func myCustomView(_ myCustomView: MyCustomView, didTapButton button: UIButton, shouldReturnView menuCustomView: MenuCustomView) {
        
        // menu custom view should be recieved here
        
        menuView?.removeFromSuperview()
        menuView = menuCustomView
        
        if let menuView = menuView {
            let heightConstant: CGFloat = 200.0
            let leadingConstraint = NSLayoutConstraint(item: menuView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0)
            let trailingConstraint = NSLayoutConstraint(item: menuView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
            let bottomConstraint = NSLayoutConstraint(item: menuView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: heightConstant)
            let heightConstraint = NSLayoutConstraint(item: menuView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: heightConstant)
            
            menuView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(menuView)
            NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
            self.view.layoutIfNeeded()
            
            bottomConstraint.constant = 0.0
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

