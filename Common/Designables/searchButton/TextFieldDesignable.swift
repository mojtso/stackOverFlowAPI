//
//  TextFieldDesignable.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//
import UIKit

@IBDesignable
class TextFieldDesignable: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
