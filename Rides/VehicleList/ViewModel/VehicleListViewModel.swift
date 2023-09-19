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
    func validateNumberOFVehicleInput(_ numOfVehicle: String) -> Bool
}
//MARK: SwiftUI property wrapper - Published and ObservableObject (communicate from VM to V)
class VehicleListViewModel : ObservableObject, VehicleListViewModelProtocol{
    private var service: NetworkService
    @Published var vehicleList = [VehicleListResponse]()
    @Published var showIndicator : Bool = true
    @Published var showErrorMsg: Bool = false
    @Published var showAlert : Bool = false
    
    //MARK: Dependency Injection by init
    init(service: NetworkService) {
        self.service = service
    }
    //MARK: Vehicle List API call
    func getVehicleList(numOfVehicle:String){
        
        if self.validateNumberOFVehicleInput(numOfVehicle){
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
        }else{
            self.showIndicator = false
            self.showAlert = true
        }

    }
    //MARK: Validation
    func validateNumberOFVehicleInput(_ numOfVehicle: String) -> Bool{
        if let num = Int(numOfVehicle){
            if num >= 1 && num <= 100{
               return true
            }else{
                return false
            }
        }
        return false
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
        self.showIndicator = false
        self.showErrorMsg = false
        self.vehicleList = respList.sorted{$0.vin! < $1.vin!}
    }
    private func sortTheResponseByCarType(_ respList:VehicleList){
        self.vehicleList = respList.sorted{$0.carType! < $1.carType!}

    }

}
