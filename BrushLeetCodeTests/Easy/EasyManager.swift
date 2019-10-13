//
//  EasyManager.swift
//  BrushLeetCodeTests
//
//  Created by huangjian on 2019/6/11.
//  Copyright © 2019 huangjian. All rights reserved.
//

import XCTest

class EasyManager: XCTestCase {

    
    //MARK: - 路径总和
    func testHasPathSum() {
        let root = TreeNode.init(1)
        root.left = TreeNode.init(2)
        root.right = TreeNode.init(2)
        root.right?.right = TreeNode.init(4)
        root.left?.left = TreeNode.init(3)
        root.left?.left?.left = TreeNode.init(5)
        let bo = EasyCode.hasPathSum(root, 6)
        print(bo)
    }
    //MARK: - 二叉树的最小深度
    func testMinDepth() {
        let root = TreeNode.init(1)
        root.left = TreeNode.init(2)
        root.right = TreeNode.init(2)
        //root.right?.right = TreeNode.init(4)
        root.left?.left = TreeNode.init(3)
        root.left?.left?.left = TreeNode.init(5)
        let minDepth = EasyCode.minDepth(root)
        print(minDepth)
    }
    
    //MARK: - 平衡二叉树
    func testIsBalanced() {
        let root = TreeNode.init(1)
        root.left = TreeNode.init(2)
        root.right = TreeNode.init(2)
        root.left?.left = TreeNode.init(3)
        root.left?.left?.left = TreeNode.init(5)
        let isBalanced = EasyCode.isBalanced(root)
        print(isBalanced)
    }
    
    //MARK: - 将有序数组转换为二叉搜索树
    func testSortedArrayToBST() {
        let node = EasyCode.sortedArrayToBST([-10,-3,0,5,9])
    }
    
    //MARK: - 二叉树的最大深度
    func testMaxDepth() {
        let root = TreeNode.init(1)
        root.left = TreeNode.init(2)
        root.right = TreeNode.init(2)
        let height = EasyCode.maxDepth(root)
        print(height)
    }
    
    //MARK: - 对称二叉树
    func testIsSymmetric() {
        let root = TreeNode.init(1)
        root.left = TreeNode.init(2)
        root.right = TreeNode.init(2)
       
        let isSymmetric = EasyCode.isSymmetric(root)
        print(isSymmetric)
    }
    //MARK: - 相同的树
    func testIsSameTree() {
        let p = TreeNode.init(1)
        p.left = TreeNode.init(2)
        p.right = TreeNode.init(3)
        
        let q = TreeNode.init(1)
        q.left = TreeNode.init(2)
        q.right = TreeNode.init(3)
        let isSame = EasyCode.isSameTree(p, q)
        print(isSame)
    }
    
    //MARK: - 合并两个有序数组
    func testMergeTwoArray() {
        var array1 = [1,5,8,9,22,0,0,0]
        let array2 = [4,10,26]
        EasyCode.merge(&array1, 5, array2, 3)
    }
    
    //MARK: - 删除排序链表中的重复元素
    func testDeleteDuplicates() {
        let l1 = ListNode.init(1)
        l1.next = ListNode.init(3)
        l1.next?.next = ListNode.init(8)
        l1.next?.next?.next = ListNode.init(8)
        l1.next?.next?.next?.next = ListNode.init(20)
        var head = EasyCode.deleteDuplicates(l1)
        while head?.next != nil {
            print(head!.val)
            head = head?.next
        }
    }
    
    //MARK: - 爬楼梯
    func testClimbStairs() {
        let num = EasyCode.climbStairs(3)
        print(num)
    }
    
    //MARK: - x 的平方根
    func testMySqrt() {
        let num = EasyCode.mySqrt(38)
        print(num)
    }
    
    //MARK: - 二进制求和
    func testAddBinary() {
        let s = EasyCode.addBinary("1010", "1011")
        print(s)
    }
    //MARK: - 加一
    func testPlusOne() {
        let array = EasyCode.plusOne([1,2,4,6,9])
        print(array)
    }
    
    //MARK: - 最后一个单词的长度
    func testLengthOfLastWord() {
        let num = EasyCode.lengthOfLastWord("hello world  ")
        print(num)
    }
    //MARK: - 最大子序和
    func testMaxSubArray(){
        
        let num = EasyCode.maxSubArray([-2,1,3,-3,6,-1,4,-2,2])
        print(num)
    }
    //MARK: - 搜索插入位置  nums 为有序的
    func testSearchInsert(){
        
        let num = EasyCode.searchInsert([1,3,5,8,10,20,30,34], 18)
        print(num)
    }
    
    //MARK: - 实现strStr()
    func testStrStr(){
        
        let num = EasyCode.strStr("aaaaaaaaaaab", "aaab")
        print(num)
    }
    //MARK: - 移除元素
    func testRemoveElement(){
        var array = [1,1,2]
        let count = EasyCode.removeElement(&array, 1)
        print(count)
    }
    //MARK: - 删除排序数组中的重复项
    func testRemoveDuplicates(){
        var array = [1,1,2]
        let count = EasyCode.removeDuplicates(&array)
        print(count)
    }
    //MARK: - 合并俩个有序链表
    func testMergeTwoLists() {
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
    //MARK: - 有效符号
    func testIsValid() {
        let pre = EasyCode.isValid("{()}")
        print(pre)
    }
    //MARK: - 最长公共前缀
    func testLongestCommonPrefix() {
        let pre = EasyCode.longestCommonPrefix(["flower","flow","flight"])
        print(pre)
    }
    //MARK: - 罗马数字转整数
    func testRomanToInt() {
        let value = "MCMXCIV"
        let num = EasyCode.romanToInt(value)
        print(num)
    }
    //MARK: - 判断整数是否为回文数
    func testIsPalindrome() {
        let value = 12321
        let isPalindrome = EasyCode.isPalindrome(value)
        print(isPalindrome)
    }
    //MARK: - 整数反转
    func testReverseInt() {
        let num = 7463847412
        let reverseNum = EasyCode.reverseInt(num)
        print(reverseNum)
    }
    //MARK: - 两数之和
    func testTwoSum() {
        let nums = [2, 11, 15, 12, 20, 99, 0, 7]
        let target = 9
        let array = EasyCode.twoSum(nums, target)
        print(array)
    }

    
    
    //MARK: - system
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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

