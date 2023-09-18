//
//  WebServices.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case notAuthenticated
    case somethingWentWrong
}
//MARK: POP
protocol NetworkService {
    func executeAPI<T:Codable>(urlString:String, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
}

class Webservice: NetworkService {
    
    //MARK: Open Closed (SOLID), Result type, Generic
    func executeAPI<T:Codable>(urlString:String, completionHandler: @escaping (Result<T, NetworkError>) -> Void){
        let request : URLRequest = self.getAPIRequest(urlString: urlString)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil{
                completionHandler(.failure(.somethingWentWrong))
            }else{
                guard let data = data, error == nil,
                      (response as? HTTPURLResponse)?.statusCode == 200 else {
                    completionHandler(.failure(.badRequest))
                    return
                }
                guard let jsonResponse = try? JSONDecoder().decode(T.self, from: data) else {
                       
                    completionHandler(.failure(.decodingError))
                    return
                }
                completionHandler(.success(jsonResponse))
            }
        })
        dataTask.resume()
    }
    //MARK: Single Responsibility (SOLID)
    //Below method is only responsible for get URL request
    private func getAPIRequest(urlString:String) -> URLRequest{
        var request = URLRequest(url: NSURL(string: urlString)! as URL)
        request.httpMethod = "GET"
        return request
    }
        
}
