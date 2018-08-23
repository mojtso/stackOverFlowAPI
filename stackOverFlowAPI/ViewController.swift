//
//  ViewController.swift
//  stackOverFlowAPI v0.0.1
//
//  Created by Mojtso on 2018/08/13.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSearch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSearch.delegate = self
    }
}

//Add SeachViewController
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        btnSearch.resignFirstResponder()
        let searchVc: SearchViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController
        searchVc.viewControllerDelegate = self
        searchVc.itemSearchedResultDelegate = self as? SearchQADelegate
        self.addViewControllerAsChildViewController(viewController: searchVc)
    }
}

//manage ViewControllers manually
extension ViewController: ViewControllerDelegate {
    func addViewControllerAsChildViewController(viewController: UIViewController) {
        //navigationBar Hide
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        })
        
        self.addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    func removeViewControllerAsChild(viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
        //navigationController show
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        })
    }
}

//Add prepare DetailVc with item
extension ViewController: SearchQADelegate {
    func didGetSearchedQa(item: Item) {
        let detailsVc: DetailsViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailsViewController
        detailsVc.item = item
        self.navigationController?.pushViewController(detailsVc, animated: true)
    }
}
