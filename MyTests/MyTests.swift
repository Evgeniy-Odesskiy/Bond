//
//  MyTests.swift
//  MyTests
//
//  Created by ECHernovol on 07.08.15.
//  Copyright (c) 2015 Bond. All rights reserved.
//

import UIKit
import XCTest
import Bond

class MyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
      var array = DynamicArray([Dynamic("one"), Dynamic("two")])
      let dynNumbers = array.mapDyn() {
        $0.map() { "\($0)\($0)" }
      }
      array.first?.value = "four"
      XCTAssertTrue(dynNumbers[0] == "fourfour", "\(dynNumbers[0])")
    }
  
  func testOne() {
    var sourceArray = DynamicArray([Dynamic("one"), Dynamic("two")])
    var mappedArray = sourceArray.mapDyn() {
      $0.map() { "\($0)\($0)" }
    }
    let mappedFirst = mappedArray.dynFirst()
    
    sourceArray.first!.value = "four"
    XCTAssertTrue(mappedFirst.value == "fourfour", "elem was not changed")
  }
  
  func testArrayStudy() {
    var sourceArray = DynamicArray(["one", "two"])
    var targetArray = DynamicArray(["one"])
    sourceArray ->> targetArray
    XCTAssertTrue(targetArray[0] == "one" && targetArray[1] == "two", "arrays are not equal")
  }
  
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
