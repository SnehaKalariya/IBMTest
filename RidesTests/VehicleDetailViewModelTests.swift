//
//  VehicleDetailViewModelTests.swift
//  RidesTests
//
//  Created by Sneha Kalariya on 2023-09-18.
//

import XCTest
@testable import Rides

final class VehicleDetailViewModelTests: XCTestCase {
    var sut : VehicleDetailViewModelProtocol!
    
    override func setUpWithError() throws {
        sut = VehicleDetailViewModel()
    }
    func test_carbon_emmission_below_5000_km(){
        sut.calculateCarbonEmmission(kiloMeter: 1500)
        XCTAssertEqual(sut.carEM, 1500)
    }
    func test_carbon_emmission_equal_5000_km(){
        sut.calculateCarbonEmmission(kiloMeter: 5000)
        XCTAssertEqual(sut.carEM, 5000)
    }
    func test_carbon_emmission_above_5000_km(){
        sut.calculateCarbonEmmission(kiloMeter: 7000)
        XCTAssertEqual(sut.carEM, 8000)
    }
    

}
