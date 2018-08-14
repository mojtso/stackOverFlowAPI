//
//  stackoverflowDTO.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/14.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import Foundation

public struct Items: Codable
{
    let items: [Item]?
    let is_answered: Bool?
    let view_count: Int?
    let score: Int?
    let last_activity_date: String?
    let creation_date: String?
    let question_id: String?
    let link: String?
    let title: String?
    let body: String?
}
