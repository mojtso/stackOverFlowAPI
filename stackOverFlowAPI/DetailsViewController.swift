//
//  DetailViewController.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    var item: Item?
    
    @IBOutlet weak var qaDescription: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var detailInfo: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var qaBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if let desc = item?.title {
            self.qaDescription.text = desc
        }
        
        if let tagArray: [String] = item?.tags {
            var tagLabel: String = ""
            for tag in tagArray {
                if tag == tagArray.last {
                    tagLabel += "\(tag)"
                } else {
                    tagLabel += "\(tag), "
                }
            }
            
            self.tags.text = tagLabel
        }
        
        if let name = item?.owner?.display_name {
            self.name.text = name
        }
        
        if let reputation = item?.owner?.reputation {
            self.views.text = "\(reputation)"
        }
        
        if let dateTime = item?.creation_date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            dateFormatter.locale = Locale(identifier: "en_US")
            
            let date = Date(timeIntervalSince1970: TimeInterval(dateTime))
            self.detailInfo.text = "asked \(dateFormatter.string(from: date))"
        }
        
        if let body = item?.body {
            let bodyString = body.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
            self.qaBody.text = bodyString
        }
        
        if let imageUrl = item?.owner?.profile_image {
            let url: URL = URL(string: imageUrl)!
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: {
                (data,response, error)  in
                if data != nil {
                    let image = UIImage(data: data!)
                    if image != nil {
                        DispatchQueue.main.async(execute: {
                            self.avatar.image = image
                        })
                    }
                }
            })
            task.resume()
        }
    }
}
