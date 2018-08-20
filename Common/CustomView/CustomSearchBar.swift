//
//  CustomSearchBar.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/19.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let index = indexOfSearchFieldInSubViews() {
            // Find the index of the search field in the search bar subviews.
            let searchField: UITextField = subviews[0].subviews[index] as! UITextField
            
            // Set its Frame
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)
            
            // Set the Font and text color of the search field
            searchField.font = prefferedFont
            searchField.textColor = UIColor.white
            
            // Set the background cilor of the search field
            searchField.backgroundColor = barTintColor
            
            // Set searchField to be first responder
            searchField.becomeFirstResponder()
        }
        
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
        let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = prefferedTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        super.draw(rect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var prefferedFont: UIFont!
    var prefferedTextColor: UIColor!
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        self.frame = frame
        prefferedFont = font
        prefferedTextColor = textColor
        
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
    }
    
    func indexOfSearchFieldInSubViews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        /*
         for var i=0; i<searchBarView.subviews.count; ++i {
         if searchBarView.subviews[i].isKindOfClass(UITextField) {
         index = i
         break
         }
         }
         */
        for i in 0...searchBarView.subviews.count - 1 {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = 1
                break
            }
        }
        
        return index
        
    }
}
