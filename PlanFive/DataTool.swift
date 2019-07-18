//
//  DataTool.swift
//  PlanFive
//
//  Created by 邹杰 on 7/18/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class DataTool {
    
    static func getCurrentYearMonthDays() -> Int!{
        var days : [NSInteger] = []
        let userCalendar : Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = userCalendar.dateComponents([.year,.month,.day, .weekday], from: Date())
        days.append(comps.year! % 2000) // 年 ，后2位数
        days.append(comps.month!) // 月
        days.append(comps.day!) // 日
        
        let nowComps = userCalendar.dateComponents([.year,.month,.day, .weekday], from: Date())
        let year =  nowComps.year
        let month = nowComps.month
        
        let startComps = NSDateComponents()
        startComps.day = 1
        startComps.month = month!
        startComps.year = year!
        
        let endComps = NSDateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month! + 1
        endComps.year = month == 12 ? year! + 1 : year!
        
        let startDate = userCalendar.date(from:startComps as DateComponents)
        let endDate = userCalendar.date(from:endComps as DateComponents)
        
        let diff = userCalendar.dateComponents([Calendar.Component.day], from: startDate!, to: endDate!)
        return diff.day!;
    }
    
    static func getCurrentYearMonth() -> Int!{
        let userCalendar : Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = userCalendar.dateComponents([.year,.month,.day,.weekday], from: Date())
        return comps.month!;
    }
}
