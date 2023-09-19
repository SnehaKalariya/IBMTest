//
//  VehicleListViewModelTests.swift
//  RidesTests
//
//  Created by Sneha Kalariya on 2023-09-18.
//

import XCTest
@testable import Rides

final class VehicleListViewModelTests: XCTestCase {
   
    private var sut : VehicleListViewModelProtocol!
    
    override func setUpWithError() throws {
        sut = VehicleListViewModel(service: NetworkServiceFactory.create())
    }
    
    //MARK: Test cases for num of vehicles entered
    
    func test_validation_with100_vehicles(){
        let inputParam = "100"
        let flag = sut.validateNumberOFVehicleInput(inputParam)
        XCTAssertEqual(flag, true)
    }
    func test_validation_with1_vehicle(){
        let inputParam = "1"
        let flag = sut.validateNumberOFVehicleInput(inputParam)
        XCTAssertEqual(flag, true)
    }
    func test_validation_with_nagetive_number_vehicle(){
        let inputParam = "-10"
        let isValid = sut.validateNumberOFVehicleInput(inputParam)
        XCTAssertEqual(isValid, false)
    }
    func test_validation_with_above100_numbers_vehicle(){
        let inputParam = "1100"
        let isValid = sut.validateNumberOFVehicleInput(inputParam)
        XCTAssertEqual(isValid, false)
    }
    func test_validation_with_0_vehicle(){
        let inputParam = "0"
        let isValid = sut.validateNumberOFVehicleInput(inputParam)
        XCTAssertEqual(isValid, false)
    }
}
