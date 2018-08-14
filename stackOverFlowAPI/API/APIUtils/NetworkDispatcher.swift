//
//  NetworkDispatcher.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/14.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import Foundation


public protocol NetworkDispatcher
{
    func dispatch(request: RequestData, onSuccess: @escaping (Data)->Void, onError: @escaping (Error)->Void)
}
