//
//  FoodVC.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/02.
//

import UIKit

class FoodVC: UIViewController {

    //Make - IBOutlet
    @IBOutlet var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var searchIdicator: UIActivityIndicatorView!
    
    @IBOutlet var seachButton: UIButton!
//---------------------------------
    
    //Make - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodVC - viewDidLoad called")
        
        self.seachButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        
        
    }
    
    //Make - IBAction
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
    }


}
