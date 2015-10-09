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
    var targetArray = DynamicArray(["four"])
    sourceArray ->> targetArray
    XCTAssertTrue(targetArray[0] == "one" && targetArray[1] == "two", "arrays are not equal")
  }
  
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
  
  func testFilter() {
   
    class Door {
      var isOpen: Dynamic<Bool>
      init(isOpen: Bool = false) {
        self.isOpen = Dynamic<Bool>(isOpen)
      }
    }
    
    let firstDoor = Door(isOpen: true)
    let secondDoor = Door()
    var doors = DynamicArray([firstDoor, secondDoor])
    var openedDoors = doors.filterDyn() { $0.isOpen }
    let firstOpenedDoor = openedDoors.dynFirst()
//    XCTAssertTrue(openedDoors.count == 1, "[Doors]false1, opened doorsCount = \(openedDoors.count)")
//    firstDoor.isOpen.value = false
//    XCTAssertTrue(openedDoors.count == 0, "[Doors]false1, opened doorsCount = \(openedDoors.count)")
//    secondDoor.isOpen.value = true
//    XCTAssertTrue(openedDoors.count == 1, "[Doors]false1, opened doorsCount = \(openedDoors.count)")
//    let doorThree = Open(isOpen: true)
//    doors[0] = doorThree
//    XCTAssertTrue(openedDoors.count == 2, "[Doors]false1, opened doorsCount = \(openedDoors.count)")
//    doorThree.isOpen.value = false
//    XCTAssertTrue(openedDoors.count == 1, "[Doors]false1, opened doorsCount = \(openedDoors.count)")
    
    XCTAssertTrue(firstOpenedDoor.value!.isOpen.value)
    firstDoor.isOpen.value = false
    XCTAssertNil(firstOpenedDoor.value)
    
//    let doorThree = Open(isOpen: true)
//    doors[0] = doorThree
//    doors.append(doorThree)
//    firstDoor.isOpen.value = false
//    doorThree.isOpen.value = false
//    XCTAssertTrue(openedDoors.count == 0, "[Doors]false2, opened doorsCount = \(openedDoors.count)")
  }

  func testMap() {
    var sourceArray = DynamicArray([Dynamic("one"), Dynamic("two")])
    var mappedArray = sourceArray.mapDyn() {
      Dynamic<String>("\($0.value)\($0.value)")
    }

    let mappedFirst = mappedArray.dynFirst()
    
    sourceArray.first!.value = "four"
    XCTAssertTrue(mappedFirst.value == "fourfour", "elem was not changed")
  }
  
  func testDZ() {
   
    class Door {
      var colour: Dynamic<Bool>?
      var alert: Dynamic<String>?
      var isOpen: Dynamic<Bool>
      init(isOpen: Bool = false) {
        self.isOpen = Dynamic<Bool>(isOpen)
      }
    }
    
    class House {
      var door: DynamicArray<Door>
      init (door: DynamicArray<Door>) {
        self.door = door
      }
    }
    
    let house = House(door: DynamicArray([Door]()))
    
  }
  


}
