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
}
