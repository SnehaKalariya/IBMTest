//
//  NetworkServiceFactory.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import Foundation
class NetworkServiceFactory {
    //MARK: Factory design pattern
    //This will create Network layer instance. In future if we need to change object creation way, we can do easily from here without impecting any Views or ViewModels
    static func create() -> NetworkService{
        return Webservice()
    }
}
