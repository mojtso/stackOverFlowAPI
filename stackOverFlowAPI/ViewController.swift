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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension ViewController {
//     func getAllQas() {
//        GetAllQas().execute(
//            onSuccess: { (items: Items) in
//                print(items)
//        }, onError: { (error: Error) in
//            print(error)
//        })
//    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        btnSearch.resignFirstResponder()
        print("trying to add a view controller")
        let searchVc: SearchViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController
        searchVc.viewControllerDelegate = self 
        self.addViewControllerAsChildViewController(viewController: searchVc)
    }
}



