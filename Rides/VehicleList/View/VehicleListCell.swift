//
//  VehicleListCell.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-18.
//

import SwiftUI

struct VehicleListCell : View{
    let  cellItem : VehicleListResponse
    var body: some View{
        return HStack(spacing:10){
                Text(cellItem.vin ?? "")
                    .frame(width: 110, alignment: .leading)
                    .font(.system(size: 12))
                Text(cellItem.makeAndModel ?? "")
                    .frame(width: 130, alignment: .center)
                    .font(.system(size: 12))
                Text(cellItem.carType ?? "")
                    .frame(width: 80, alignment: .leading)
                    .font(.system(size: 12))
            }
        .frame(width: UIScreen.screenWidth)
    }
}
struct TableHeader: View {
    var body: some View {
        HStack(spacing:10){
            Text("Vin")
                .frame(width: 110, alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Make & Model")
                .frame(width: 130, alignment: .center)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Car Type")
                .frame(width: 80, alignment: .leading)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(height: 50)
        
    }
}
