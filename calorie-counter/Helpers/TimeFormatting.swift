//
//  TimeFormatting.swift
//  calorie-counter
//
//  Created by David Venegas on 2/28/23.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow) / 60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 60 {
        return "\(minutes) minutes ago"
    } else if minutes >= 60 && hours < 24 {
         return "\(hours) hours ago"
    } else {
        return "\(days) days ago"
    }
}


