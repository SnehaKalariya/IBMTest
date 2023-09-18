//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import SwiftUI

struct VehicleDetailView: View {
    @Binding var vehicleList : VehicleListResponse
    
    var body: some View {
        VStack(spacing:40){
            Text("Car Details")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .font(.system(size: 28))
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
            Spacer()
        }.padding(20)
        .frame(width: UIScreen.screenWidth-40,height: UIScreen.screenHeight-50)

    }
}

