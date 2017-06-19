//
//  ChatViewModel.swift
//  ChatChat
//
//  Created by Mark Rabins on 6/18/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation
import JSQMessagesViewController

class ChatViewModel: NSObject {
    
    var fbClient = FirebaseClient()
    var messages: [JSQMessage]?
    var localTyping = false
    
    
    func numberOfItemsInSection(section: Int) -> Int {
        return fbClient.messages.count
        
    }
    
    var isTyping: Bool {
        get {
            return self.localTyping
        }
        set {
            self.localTyping = newValue
            fbClient.userIsTypingRef.setValue(newValue)
        }
    }
    
    func dateFormatter() -> String {
        var timeOffset = ""
        for chats in messages! {
            let messageDate = chats.date
            
            let calendar = Calendar.current
            let messageDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: messageDate!)
            
            let currentDate = Date()
            let currentMessagesDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: currentDate)
            
            
            let years = currentDate.years(from: currentDate)
            let months = currentDate.months(from: currentDate)
            let weeks = currentDate.weeks(from: currentDate)
            let days = currentDate.days(from: currentDate)
            let hours = currentDate.hours(from: currentDate)
            let minutes = currentDate.minutes(from: currentDate)
            let seconds = currentDate.seconds(from: currentDate)
            
            timeOffset = currentDate.offset(from: messageDate!)
            
            print("\(messageDateComponents)\(years):\(months):\(weeks): \(days): \(hours): \(minutes): \(seconds) \(currentMessagesDateComponents)")
            
            
        }
        return timeOffset
        
    }
    
}

extension Date {
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

