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
    var itemSearchedResultDelegate: SearchQADelegate?
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
        self.itemSearchedResultDelegate?.didGetSearchedQa(item: self.itemsDto[indexPath.row])
        self.viewControllerDelegate?.removeViewControllerAsChild(viewController: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCellId", for: indexPath) as! SearchTableViewCell
        
        cell.qaDescription.text = itemsDto[indexPath.row].title!
        
        if let askedBy: String = itemsDto[indexPath.row].owner?.display_name  {
            cell.askedBy.text = "asked by \(askedBy)"
        }
        if let votes: Int = itemsDto[indexPath.row].owner?.accept_rate {
            cell.votes.text = "\(votes) votes"
        }
        if let answers: Int = itemsDto[indexPath.row].answer_count {
            cell.answers.text = "\(answers) answers"
        }
        if let views: Int = itemsDto[indexPath.row].view_count {
            cell.views.text = "\(views) views"
        }
        
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
        self.itemsDto = []
        var request = GetAllQas()
        if let encodedTag = tag.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            request.path = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=\(encodedTag)&site=stackoverflow&filter=withbody"
            request.execute(
                onSuccess: { (items) in
                    self.itemsDto = items.items!
                    self.tableView.reloadData()
            }, onError: { (error: Error) in
                //do something??
                print(error)
            })
        }
    }
}
