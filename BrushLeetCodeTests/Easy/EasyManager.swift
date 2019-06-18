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
        //reverseInt()
        //isPalindrome()
        //romanToInt()
        //longestCommonPrefix()
        //isValid()
        mergeTwoLists()
    }
    //MARK: - 合并俩个有序链表
    func mergeTwoLists() {
        let l1 = ListNode.init(1)
        l1.next = ListNode.init(3)
        l1.next?.next = ListNode.init(8)
        let l2 = ListNode.init(5)
        l2.next = ListNode.init(7)
        l2.next?.next = ListNode.init(20)
        var list = EasyCode.mergeTwoLists(l1, l2)
        while list != nil {
            print(list!.val)
            list = list?.next
        }
    }
    //MARK: - 最长公共前缀
    func isValid() {
        let pre = EasyCode.isValid("{()}")
        print(pre)
    }
    //MARK: - 最长公共前缀
    func longestCommonPrefix() {
        let pre = EasyCode.longestCommonPrefix(["flower","flow","flight"])
        print(pre)
    }
    //MARK: - 罗马数字转整数
    func romanToInt() {
        let value = "MCMXCIV"
        let num = EasyCode.romanToInt(value)
        print(num)
    }
    //MARK: - 判断整数是否为回文数
    func isPalindrome() {
        let value = 12321
        let isPalindrome = EasyCode.isPalindrome(value)
        print(isPalindrome)
    }
    //MARK: - 整数反转
    func reverseInt() {
        let num = 7463847412
        let reverseNum = EasyCode.reverseInt(num)
        print(reverseNum)
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
