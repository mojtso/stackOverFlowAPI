//
//  SearchTableViewController.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

struct GetAllQas: RequestType {
    
    typealias ResponseType = Items
    var path: String?
    var data: RequestData {
        return RequestData(path: path!)
    }
}

class SearchViewController: UIViewController {
    
    var customSearchController: CustomSearchController!
    var viewControllerDelegate: ViewControllerDelegate?
    var didGetSearchedResults: SearchQADelegate?
    var itemsDto: [Item] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.white, searchTintColor: UIColor.init(red: 64/255, green: 120/255, blue: 196/255, alpha: 1/255))
        
        customSearchController.customSearchBar.placeholder = "Search"
        tableView.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsDto.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCellId", for: indexPath) as! SearchTableViewCell
        
        cell.qaDescription.text = itemsDto[indexPath.row].title!
        
        return cell
    }
}

extension SearchViewController: CustomSearchControllerDelegate {
    func didStartSearching(searchText: String) {
        print(searchText)
    }
    
    func didTapOnSearchButton(searchText: String) {
        
    }
    
    func didTapOnCancelButton() {
        self.viewControllerDelegate?.removeViewControllerAsChild(viewController: self)
    }
    
    func didChangeSearchText(searchText: String) {
        getAllQas(tag: searchText)
    }
}

extension SearchViewController {
    func getAllQas(tag: String) {
        var request = GetAllQas()
        request.path = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=swift%203&site=stackoverflow&filter=withbody"
        request.execute(
            onSuccess: { (items) in
                self.itemsDto = items.items!
                self.tableView.reloadData()
        }, onError: { (error: Error) in
            print(error)
        })
    }
}
