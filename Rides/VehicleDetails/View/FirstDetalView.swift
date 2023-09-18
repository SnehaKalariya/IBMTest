//
//  FirstDetalView.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-18.
//

import SwiftUI

struct FirstDetalView : View{
    var vehicleList : VehicleListResponse
    var currentPage : Int
    var viewModel : VehicleDetailViewModel
    
    var body: some View{
        VStack(spacing:40){
            if currentPage == 0{
                HStack(spacing: 10){
                    Text("Vin:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Text(vehicleList.vin ?? "")
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack(spacing: 10){
                    Text("Make & Model:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Text(vehicleList.makeAndModel ?? "")
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack(spacing: 10){
                        Text("Car Type:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Text(vehicleList.carType ?? "")
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack(spacing: 10){
                    Text("Color:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    Text(vehicleList.color ?? "")
                        .font(.system(size: 20))
                    Spacer()

                }
            }else{
                VStack(spacing: 10){
                    Text(RidesConstant.carbonEmission)
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                    Text(viewModel.carEMStr)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
            }
            
            Spacer()
        }
    }
}

