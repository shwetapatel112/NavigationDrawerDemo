//
//  CentreViewController.swift
//  NavigationDrawerDemo
//
//  Created by Administrator on 05/04/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import DrawerController

class CentreViewController: UIViewController, UISearchBarDelegate {

    //lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 230, height: 20))
    lazy var searchBar:UISearchBar = UISearchBar()
    var searchBarButtonItem: UIBarButtonItem?
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    

    func setupNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.cyan
        self.navigationController?.view.layer.cornerRadius = 10.0
        self.view.backgroundColor = UIColor.blue
        
        setupLeftMenuButton()
        setupMenuLabel()
        setupSearchMenuButton()
        
        searchBar.delegate = self
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.searchBarStyle = UISearchBarStyle.minimal
    }
    
    //Mark:- Search Bar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showSearchBar()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    
    //Mark:- Menu Search
    func showSearchBar() {
        searchBar.alpha = 0
        navigationItem.titleView = searchBar
        navigationItem.setRightBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.4, animations: {
            self.searchBar.alpha = 1
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    func hideSearchBar() {
        label?.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationItem.titleView = self.label
            self.label.alpha = 1
            self.navigationItem.setRightBarButton(self.searchBarButtonItem, animated: true)
        }, completion: { finished in
           
        })
    }
    
    
    func setupSearchMenuButton(){
        searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(searchBarSearchButtonClicked(_:)))
        navigationItem.setRightBarButton(searchBarButtonItem, animated: true)
    }
    
    //Mark:- Navigation label

    func setupMenuLabel(){
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 18))
        label.text = "Navigation Demo"
        navigationItem.titleView = label
    }
    
    //Mark:- Left menu
    
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: #selector(leftDrawerButtonPress(_:)))
        navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }

    
    func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    
    
}
