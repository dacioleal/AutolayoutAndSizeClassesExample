//
//  MainViewController.swift
//  AutolayoutSizesExample
//
//  Created by Dacio Leal Rodriguez on 9/9/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainStackView : UIStackView = UIStackView()
    
    override func loadView() {
        let backView = UIView()
        backView.backgroundColor = UIColor.redColor()
        
        mainStackView.axis = .Vertical
        mainStackView.distribution = .FillEqually
        mainStackView.spacing = 30.0
        mainStackView.backgroundColor = UIColor.yellowColor()
        backView .addSubview(mainStackView)
        
        let button1 = UIButton(type: .System)
        button1.setTitle("Button1", forState: .Normal)
        button1.backgroundColor = UIColor.whiteColor()
        mainStackView.addArrangedSubview(button1)
        
        let button2 = UIButton(type: .System)
        button2.setTitle("Button2", forState: .Normal)
        button2.backgroundColor = UIColor.whiteColor()
        mainStackView.addArrangedSubview(button2)

        
        let views = ["mainStackView":mainStackView]
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints1 = NSLayoutConstraint.constraintsWithVisualFormat("|-15-[mainStackView]-15-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: views)
        let constraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[mainStackView]-15-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: views)
        backView.addConstraints(constraints1)
        backView.addConstraints(constraints2)
        
        self.view = backView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent = false
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
        if self.traitCollection.horizontalSizeClass == .Regular {
            mainStackView.axis = .Horizontal
        } else if self.traitCollection.horizontalSizeClass == .Compact {
            mainStackView.axis = .Vertical
        }
        print("TraitCollection:\(self.traitCollection)")
    }
    

}
