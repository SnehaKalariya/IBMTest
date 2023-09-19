//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import SwiftUI

struct VehicleDetailView: View {
    @Binding var vehicleList : VehicleListResponse
    @EnvironmentObject var viewModel : VehicleDetailViewModel
    @State private var currentPage = 0
    
    //MARK: Implemented Paging for swiping
    var body: some View {
        VStack(spacing:20){
            Text("Car Details")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .font(.system(size: 28))
            PageView(pages: [
                FirstDetalView(vehicleList: vehicleList, currentPage: 0, viewModel: viewModel),
                FirstDetalView(vehicleList: vehicleList, currentPage: 1, viewModel: viewModel)
            ], currentPage: $currentPage)
            Spacer()
            if currentPage == 0{
                Text(RidesConstant.swipeMsg)
                    .foregroundColor(.red.opacity(0.8))
            }
        }
        .padding(20)
        .onAppear(perform: {
            self.viewModel.calculateCarbonEmmission(kiloMeter: Double(vehicleList.kilometrage ?? 0))
        })
    }
}

