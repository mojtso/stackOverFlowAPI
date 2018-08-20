//
//  CustomSearchController.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

protocol CustomSearchControllerDelegate {
    func didStartSearching(searchText: String)
    
    func didTapOnSearchButton(searchText: String)
    
    func didTapOnCancelButton()
    
    func didChangeSearchText(searchText: String)
}



class CustomSearchController: UISearchController, UISearchBarDelegate {

    var customSearchBar: CustomSearchBar!
    var customDelegate: CustomSearchControllerDelegate!
    
    
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        configureSearchBar(frame: searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchTintColor)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, font: font, textColor: bgColor)
        customSearchBar.barTintColor = bgColor
        customSearchBar.tintColor = textColor
        customSearchBar.showsBookmarkButton = false
        customSearchBar.showsCancelButton = true
        
        customSearchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CustomSearchController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let text: String = searchBar.text {
            customDelegate.didTapOnSearchButton(searchText: text)
            customSearchBar.resignFirstResponder()
        } else {
            customSearchBar.resignFirstResponder()
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        UIApplication.shared.beginIgnoringInteractionEvents()
        if let text: String = searchBar.text {
            customDelegate.didChangeSearchText(searchText: text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnCancelButton()
    }
}
