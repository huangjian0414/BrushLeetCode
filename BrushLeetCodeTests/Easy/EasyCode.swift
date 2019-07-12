//
//  EasyCode.swift
//  BrushLeetCodeTests
//
//  Created by huangjian on 2019/6/11.
//  Copyright © 2019 huangjian. All rights reserved.
//

import Foundation

struct EasyCode {
    //MARK: - 两数之和
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int]{
        let count = nums.count
        var dict = [Int:Int]()
        for i in 0..<count {
            let found = target - nums[i]
            if let j = dict[found],j != i{//target减去当前的数得到的值去存过的字典里取下标，如果有且下标和当前遍历到的下标不相等，则找到了
                return [i,j]
            }
            dict[nums[i]] = i //遍历一个，以数为key，下标为值存到字典
        }
        
        return [];
    }
    //MARK: - 整数反转（假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]）
    static func reverseInt(_ x: Int) -> Int{
        var reverse = 0
        var value = x   //如 3576
        while value != 0 {//取余，一步步把最后的数移到前面
            let pop = value % 10 //6 -- 7 -- 5 -- 3
            value = value/10     //357 -- 35 -- 3 -- 0
            reverse = reverse * 10 + pop //6 -- 67 -- 675 -- 6753
            if reverse > Int32.max || (reverse == Int32.max && pop > 7) || reverse < Int32.min || (reverse == Int32.min && pop < -8) { return 0}//超过存储范围溢出
        }
        return reverse;
    }
    //MARK: - 判断整数是否为回文数 (回文数：正反都一样)
    static func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {//x小于0不是回文数，x最后一位是0，只有x=0才是回文数
            return false
        }
        var reverse = 0
        var value = x   //如 12321
        while value > reverse { //反转一半
            reverse = reverse * 10 + value % 10  //1 -- 12 -- 123
            value = value / 10 //1232 -- 123 -- 12
        }
        return value == reverse || value == reverse / 10
    }
    //MARK: - 罗马数字转整数
    static func romanToInt(_ s: String) -> Int {
        var sum = 0
        let map = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        
        /*
         如M CM XC IV = M + (M-C) + (C-X) + (V-I)  : M=1000 CM=M-C=900 XC=C-X=90 IV=V-I=4
         i=0  C<M  sum = M
         i=1  M>C  sum = M - C
         i=2  X<M  sum = M - C + M
         i=3  C>X  sum = M - C + M - X
         i=4  I<C  sum = M - C + M - X + C
         i=5  V>I  sum = M - C + M - X + C - I
         i=6       sum = M - C + M - X + C - I + V = 1000-100+1000-10+100-1+5 = 1994
         */
        
        for (i,value) in s.enumerated() {
            if i == s.count - 1 ||
                map[String(s[s.index(s.startIndex, offsetBy: i + 1)..<s.index(s.startIndex, offsetBy: i + 2)])]!
                <= map[String(value)]!{//如果下一个字节从字典里取到的值小于等于当前字节从字典里取到的值，加上当前的值
                sum += map[String(value)]!
            } else { //反之 减去当前的值
                sum -= map[String(value)]!
            }
        }
        return sum
    }
    //MARK: - 最长公共前缀(水平扫描)
    static func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        var pre = strs[0]
        for i in 1..<strs.count {//从左到右依次筛选
            while strs[i].hasPrefix(pre) == false
            {
                pre.removeLast()
                if pre.count == 0
                {
                    return ""
                }
            }
        }
        return pre
//        return longestCommonPrefix(strs, left: 0, right: strs.count-1)
    }
    //MARK: - 最长公共前缀(分治法) 貌似更久
    static func longestCommonPrefix(_ strs: [String],left: Int,right: Int) -> String {
        if left == right {
            return strs[left]
        }
        let mid = (left + right)/2;
        let lcpLeft =   longestCommonPrefix(strs, left: left , right: mid);
        let lcpRight =  longestCommonPrefix(strs, left: mid + 1,right: right);
    
        return commonPrefix(left: lcpLeft, right: lcpRight);
    }
    static func commonPrefix(left: String,right: String) -> String {
        let minCount = min(left.count,right.count)
        for i in 0..<minCount { //左右俩个数依次对比，筛选出公共部分
            if String(left[left.index(left.startIndex, offsetBy: i)...left.index(left.startIndex, offsetBy: i)]) != String(right[right.index(right.startIndex, offsetBy: i)...right.index(right.startIndex, offsetBy: i)])
            {
                return String(left[left.startIndex..<left.index(left.startIndex, offsetBy: i)])
            }
        }
        return String(left[left.startIndex..<left.index(left.startIndex, offsetBy: minCount)])
    }
    //MARK: - 有效符号(栈思想，后进先出)
    static func isValid(_ s: String) -> Bool {
        var array = [Character]()
        for c in s {
            switch c {
            case "{","(","[" :
                array.append(c) //入栈
                break
            case "}" : //删除最后的一个与之相应的符号，否则不是有效符号
                guard array.last == "{" else { return false }
                array.removeLast()
                break
            case ")" :
                guard array.last == "(" else { return false }
                array.removeLast()
                break
            case "]" :
                guard array.last == "[" else { return false }
                array.removeLast()
                break
            default:
                break
            }
        }
        return array.isEmpty
    }
    
    //MARK: - 合并俩个有序链表
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }else if l2 == nil {
            return l1
        }else if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    //MARK: - 删除排序数组中的重复项
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count != 0 else {return 0}
        
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j]{
                i += 1
                nums[i] = nums[j] //不相同的覆盖相同的
            }
        }
        return i + 1
        
        
//        if nums.count == 1 {
//            return 1
//        }
//        var uniq = Set.init(arrayLiteral: nums)
//        nums = nums.filter {//去重
//            return uniq.insert([$0]).inserted
//        }
//        return nums.count
        
    }
    //MARK: - 移除元素
    static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val{ // i 为等于val 的下标，不相等的时候，覆盖掉
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    //MARK: - 实现strStr()
    static func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        //leetcode 算的速度和xcode算的速度，完全不一样，系统方法xcodeb显示很快，leetcode直接超时，leetcode通过的算法，xcode 超时
//        let s1 = haystack as NSString
//        let range = s1.range(of: needle)
//        if range.length == 0 {
//            return -1
//        }
//        return range.location
        
        for i in 0...(haystack.count-needle.count) {
            if (haystack[haystack.index(haystack.startIndex, offsetBy: i)..<haystack.index(haystack.startIndex, offsetBy: i + needle.count)] == needle) { //截取字符串看是否与needle相等
                return i
            }
        }
        return -1
        
    }
    
    //MARK: - 搜索插入位置  nums 为有序的
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
//        for j in 0..<nums.count {
//            if nums[j] >= target{//因为是有序的，所以找到第一个大于 就直接return了
//                return j
//            }
//        }
//        return nums.count
        
        var low = 0
        var high = nums.count
        var mid = 0
        
        while low < high {
            mid = (high + low) / 2  //2分，leetcode 时间一样
            if nums[mid] > target {
                high = mid
            }else if nums[mid] < target {
                low = mid + 1
            }else{
                return mid
            }
        }
        return low
        
    }
    //MARK: - 最大子序和
    static func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0{ //sum 对结果有增益效果，则sum保留并加上当前遍历数字
                sum += num
            }else{//sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
                sum = num
            }
            maxValue =  max(maxValue, sum)//每次都比较maxValue和sum的大小，并将maxValue置为最大值
        }
        return maxValue
    }
    //MARK: - 最后一个单词的长度
    static func lengthOfLastWord(_ s: String) -> Int {

        var i = 0
        for v in s.reversed() {
            if v == " "{
                if i > 0 { //已经查到不是空格的，这时候遇到空格，就是最后的单词了
                    return i
                }
            }else{
                i += 1 //不是空格 +1
            }
        }
        return i
    }
    //MARK: - 加一
    static func plusOne(_ digits: [Int]) -> [Int] {
//        var i = digits.count - 1
        var arr = digits
//        while i >= 0 {
//            if arr[i] == 9{
//                arr[i] = 0
//                if i == 0{//如果是999这种，要多插一位
//                    arr.insert(1, at: 0)
//                }
//                i -= 1
//            }else{ //不等于9。直接return
//                arr[i] += 1
//                return arr
//            }
//        }
        for (i,_) in arr.enumerated().reversed() {
            arr[i] += 1
            arr[i] %= 10
            if arr[i] != 0{
                return arr
            }
        }
        arr.insert(1, at: 0)
        return arr;
    }
    //MARK: - 二进制求和
    static func addBinary(_ a: String, _ b: String) -> String {//leetcode 84ms 有点水
        let aArray = Array(a) // 转数组 32ms
        let bArray = Array(b)
        let count = max(aArray.count, bArray.count)
        var s = ""
        var j = 0
        for i in 0..<count {
            var aNum = 0;
            if i < aArray.count{
//                aNum = Int(a[a.index(a.startIndex, offsetBy: a.count-i-1)...a.index(a.startIndex, offsetBy: a.count-i-1)])!
                aNum = Int(String(aArray[aArray.count-i-1]))!
            }
            var bNum = 0;
            if i < bArray.count{
//                bNum = Int(b[b.index(b.startIndex, offsetBy: b.count-i-1)...b.index(b.startIndex, offsetBy: b.count-i-1)])!
                bNum = Int(String(bArray[bArray.count-i-1]))!
            }
            let k = aNum + bNum + j
            var x = k
            if k >= 2 {
                j = 1
                x = k - 2
            }else{
                j = 0
            }
            s.insert(contentsOf: "\(x)", at: s.startIndex)
            if i == (count - 1) && k >= 2{
                s.insert("1", at: s.startIndex)
            }
        }
        return s
    }
    //MARK: - x 的平方根 (牛顿迭代法)
    static func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        //20ms
//        var last: Double = 0
//        var res: Double =  Double(x/2 + 1)
//        while res != last {
//            last = res
//            res = (res+Double(x)/res)/2
//            print("res -- \(res)-- last --\(last)")
//        }
//        return Int(res)
        
        // 12ms
        var last = x/2 + 1
        var res = x/2 + 1
        while res*last > x {
            last = res
            res = (res+x/res)/2
        }
        return res
    }
    //MARK: - 爬楼梯 (动态规划)  4ms
    static func climbStairs(_ n: Int) -> Int {
        if n<=3 {
            return n
        }
        var array = [Int](repeating: 0, count: n+1)
        array[2] = 2
        array[3] = 3
        for i in 4...n { //一层层的加，算方法数
            array[i] = array[i-1] + array[i-2] //数组存储到达第i层的方法数
        }
        return array[n]
    }
    
    //MARK: - 删除排序链表中的重复元素
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        var current = head
        while current?.next != nil { //递归
            if current?.val == current?.next?.val{
                current?.next = current?.next?.next
            }else{
                current = current?.next
            }
        }
        return head
    }
    //MARK: - 合并两个有序数组
    static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var p = m + n - 1 //合并后数组大小
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j]
            {
                nums1[p] = nums1[i]
                i -= 1
            }else{
                nums1[p] = nums2[j]
                j -= 1
            }
            p -= 1
        }
        while j >= 0 {
            nums1[p] = nums2[j]
            j -= 1
            p -= 1
        }
        print(nums1)
    }
    
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

