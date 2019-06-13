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
}
