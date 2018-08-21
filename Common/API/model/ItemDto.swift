//
//  Item.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/14.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import Foundation


public struct Item: Codable
{
    let owner: Owner?
    let tags: [String]?
    let is_answered: Bool?
    let view_count: Int?
    let answer_count: Int?
    let score: Int?
    let last_activity_date: Int?
    let creation_date: Int?
    let question_id: Int?
    let link: String?
    let title: String?
    let body: String?
}
