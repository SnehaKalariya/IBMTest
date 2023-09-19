//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import Foundation

protocol VehicleDetailViewModelProtocol{
    func calculateCarbonEmmission(kiloMeter:Double)
    var carEM : Double{ get }
}
class VehicleDetailViewModel : ObservableObject, VehicleDetailViewModelProtocol{
    var carEM : Double = 0
    @Published var carEMStr : String = ""
    
    //MARK: Calculating Carbon Emmission
    func calculateCarbonEmmission(kiloMeter:Double){
        if kiloMeter <= RidesConstant.kmRange{
            carEM = kiloMeter
        }else{
            let remainingKM = kiloMeter - RidesConstant.kmRange
            carEM = RidesConstant.kmRange + (1.5*remainingKM)
        }
        carEMStr = "\(String(format: "%.0f", carEM)) units"
    }
}
