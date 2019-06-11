//
//  EasyManager.swift
//  BrushLeetCodeTests
//
//  Created by huangjian on 2019/6/11.
//  Copyright © 2019 huangjian. All rights reserved.
//

import XCTest

class EasyManager: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //twoSum()
    }
    //MARK: - 两数之和
    func twoSum() {
        let nums = [2, 11, 15, 12, 20, 99, 0, 7]
        let target = 9
        let array = EasyCode.twoSum(nums, target)
        print(array)
    }
    
    
    
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
