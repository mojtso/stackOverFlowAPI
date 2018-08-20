//
//  OwnerDto.swift
//  stackOverFlowAPI
//
//  Created by Mojtso on 2018/08/14.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import Foundation

public struct Owner: Codable
{
    var reputation: Int?
    let user_id: Int?
    let user_type: String?
    let profile_image: String?
    let display_name: String?
    let link: String?
}
