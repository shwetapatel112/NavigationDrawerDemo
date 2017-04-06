//
//  CentreViewController.swift
//  NavigationDrawerDemo
//
//  Created by Administrator on 05/04/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import DrawerController

class CentreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLeftMenuButton()
        let barColor = UIColor(red: 247/255, green: 249/255, blue: 250/255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = barColor
        
        self.navigationController?.view.layer.cornerRadius = 10.0
        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }

    
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: #selector(leftDrawerButtonPress(_:)))
        self.navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }
    
    
    func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    
    
}
