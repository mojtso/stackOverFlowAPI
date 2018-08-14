//
//  ViewController.swift
//  stackOverFlowAPI v0.0.1
//
//  Created by Mojtso on 2018/08/13.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit


struct GetAllQas: RequestType {
    typealias ResponseType = Items
    var data: RequestData {
        return RequestData(path: "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=swift%203&site=stackoverflow&filter=withbody")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetAllQas().execute(
            onSuccess: { (items: Items) in
            print(items)
        }, onError: { (error: Error) in
            print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

