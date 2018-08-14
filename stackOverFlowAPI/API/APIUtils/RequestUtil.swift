//
//  RequestUtil.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/14.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import Foundation


public struct RequestData
{
    public let path: String
    public let method: String
    public let params: [String:Any?]?
    public let headers: [String:String]?
    
    public init(path: String, method: String = "GET", params: [String:Any?]? = nil, headers: [String:String]? = nil)
    {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}
