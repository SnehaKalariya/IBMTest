//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import Foundation
protocol VehicleListViewModelProtocol{
    func getVehicleList(numOfVehicle:String)
    func handleSorting(_ type:String)
}
//MARK: SwiftUI property wrapper - Published and ObservableObject (communicate from VM to V)
class VehicleListViewModel : ObservableObject, VehicleListViewModelProtocol{
    private var service: NetworkService
    @Published var vehicleList = [VehicleListResponse]()
    @Published var showIndicator : Bool = true
    @Published var showErrorMsg: Bool = false
    
    //Dependency Injection by init
    init(service: NetworkService) {
        self.service = service
    }
    //MARK: Vehicle List API call
    func getVehicleList(numOfVehicle:String){
        
        let urlStr = "\(RidesConstant.baseUrl)\(RidesConstant.vehicleListUrl)\(numOfVehicle)"
        DispatchQueue.global(qos: .background).async {
            self.service.executeAPI(urlString: urlStr) { (resultData:Result<VehicleList,NetworkError>) in
                switch resultData{
                case .success(let response):
                    DispatchQueue.main.async {
                        self.sortTheResponseByVin(response)
                    }
                case .failure(let error):
                    print("error \(error)")
                    DispatchQueue.main.async {
                        self.showErrorMsg = true
                        self.showIndicator = false
                    }
                }
            }
        }
    }
    //MARK: Handle Sorting Selection
    func handleSorting(_ type:String){
        if type == SortingType.Vin.rawValue{
            self.sortTheResponseByVin(vehicleList)
        }else{
            self.sortTheResponseByCarType(vehicleList)
        }
    }
    private func sortTheResponseByVin(_ respList:VehicleList){
        let sortedArray = respList.sorted{$0.vin! < $1.vin!}
        self.showIndicator = false
        self.showErrorMsg = false
        self.vehicleList = sortedArray
    }
    private func sortTheResponseByCarType(_ respList:VehicleList){
        let sortedArray = respList.sorted{$0.carType! < $1.carType!}
        self.vehicleList = sortedArray

    }

}
