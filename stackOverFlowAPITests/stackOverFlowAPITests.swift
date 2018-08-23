//
//  stackOverFlowAPITests.swift
//  stackOverFlowAPITests
//
//  Created by Mojtso on 2018/08/13.
//  Copyright © 2018 Mojalefa Tsoaeli. All rights reserved.
//

import XCTest
@testable import stackOverFlowAPI


class stackOverFlowAPITests: XCTestCase {
    
    
    
    
    var itemDto: Items?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItems() {
        self.getAllQasWithTag(tag: "Swift")
        XCTAssertNotNil(self.itemDto != nil, "itemDto.items IS 0")
    }
    
    func testItemNil() {
        self.getAllQasWithTag(tag: "")
        XCTAssertNil(self.itemDto, "itemDto NOT nil")
    }
    
    
    func getAllQasWithTag(tag: String) {
        var request = GetAllQas()
        let encodedTag = tag.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        request.path = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=\(encodedTag!)&site=stackoverflow&filter=withbody"
        
        request.execute(onSuccess: {(item: Items) in
            self.itemDto = item
            if(item.items?.count == nil) {
                self.itemDto = nil
            }
        }, onError: {(error: Error) in
            self.itemDto = nil
        })
        
    }
}


