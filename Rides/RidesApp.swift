//
//  RidesApp.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-16.
//

import SwiftUI

@main
struct RidesApp: App {
    let vm = VehicleListViewModel(service: NetworkServiceFactory.create())

    var body: some Scene {
        WindowGroup {
            //MARK: Dependency Inversion achieved by injecting dependency from here (SOLID)
            VehicleListView()
                .environmentObject(vm)
        }
    }
}
