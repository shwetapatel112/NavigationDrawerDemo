//
//  CentreViewController.swift
//  NavigationDrawerDemo
//
//  Created by Administrator on 05/04/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import DrawerController

class CentreViewController: UIViewController, UISearchBarDelegate,UITableViewDelegate, UITableViewDataSource {

    //lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 230, height: 20))
    lazy var searchBar:UISearchBar = UISearchBar()
    var searchBarButtonItem: UIBarButtonItem?
    var label : UILabel!
     var marrCountryList = [String]()
    var searchedCountryList = [String]()
    
    @IBOutlet weak var centreTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        marrCountryList = ["USA", "Bahamas", "Brazil", "Canada", "Republic of China", "Cuba", "Egypt", "Fiji", "France", "Germany", "Iceland", "India", "Indonesia", "Jamaica", "Kenya", "Madagascar", "Mexico", "Nepal", "Oman", "Pakistan", "Poland", "Singapore", "Somalia", "Switzerland", "Turkey", "UAE", "Vatican City"]
        searchedCountryList = marrCountryList
        centreTableView.delegate = self
        centreTableView.dataSource = self
        
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
    
    //MARK:- Search Bar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showSearchBar()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("-->> \(searchText)")
        triggerSearch(searchText: searchText)
    }
    
    
    //MARK:- Menu Search
    func triggerSearch(searchText : String){
        searchedCountryList = []
        if searchText.characters.count == 0{
            searchedCountryList = marrCountryList
        }else{
            for val in marrCountryList{
                if val.contains(searchText){
                    searchedCountryList.append(val)
                }
            }
        }
        centreTableView.reloadData()
    }
    
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
    
    //MARK:- Navigation label

    func setupMenuLabel(){
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 18))
        label.text = "Navigation Demo"
        navigationItem.titleView = label
    }
    
    //MARK:- Left menu
    
    func setupLeftMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: #selector(leftDrawerButtonPress(_:)))
        navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }

    
    func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    
    //MARK:- Table methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedCountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CenterTableCellId", for: indexPath) as! CentreTableViewCell
        cell.cellItemLabel.text = searchedCountryList[indexPath.row]
        return cell
    }
}
