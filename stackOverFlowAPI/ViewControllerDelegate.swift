//
//  ViewControllerDelegate.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func addViewControllerAsChildViewController(viewController: UIViewController)
    func removeViewControllerAsChild(viewController: UIViewController)
}
