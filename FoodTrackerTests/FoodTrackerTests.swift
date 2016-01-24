//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Matthew Kuntz on 9/17/15.
//  Copyright © 2015 Matthew Kuntz. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    //MARK: Meal Test
    func testMealInit(){
        //success cases
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        
        //failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty Name is invalid")
        
        let badRating = Meal(name: "really gross", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid")
        
    }
    
}
