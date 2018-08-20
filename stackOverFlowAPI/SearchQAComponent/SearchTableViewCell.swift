//
//  SearchTableViewCell.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var qaDescription: UILabel!
    @IBOutlet weak var askedBy: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var answers: UILabel!
    @IBOutlet weak var views: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
