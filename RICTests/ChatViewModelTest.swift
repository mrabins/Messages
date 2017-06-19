//
//  ChatViewModelTest.swift
//  ChatChat
//
//  Created by Mark Rabins on 6/19/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import XCTest
@testable import ChatChat

class ChatViewModelTest: XCTestCase {
    let chatViewModel = ChatViewModel()

    func testnumberOfItemsInSection() {
        let num = 3
        XCTAssertNil(chatViewModel.numberOfItemsInSection(section: num))
    }
    
    func testdateFormatter() {
        let str = String()
        XCTAssertEqual(str, chatViewModel.dateFormatter())
        
    }
    
    func testisTyping() {
        XCTAssertEqual(false, chatViewModel.isTyping)
    }
    
}


