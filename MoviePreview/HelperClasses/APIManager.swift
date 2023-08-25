//
//  APIManager.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import Foundation
import Alamofire

class APIManager {

    func popularMovies(parameters: [String:String],
                        completionHandler: @escaping (MoviesList?,Error?) -> Void) -> Void {
        
        var headers:[String: String] = [
          "accept": "application/json",
          "Authorization": "Bearer \(Constants.apiAuthorization)"
        ]
        
        let httpHeaders = HTTPHeaders(headers)
        
        headers.merge(parameters) { (_, new) in new }
        
        let url = URL(string: Constants.popularMoviesUrl)!
        AF.request(url,method: .get,headers: httpHeaders).response { response in
            if let data = response.data{
                let movieList = try? JSONDecoder().decode(MoviesList.self, from: data)
                    completionHandler(movieList,nil)
                    
            }else{
                completionHandler(nil,response.error)
            }
           }
        
    }
    
    
    func movieDetails(movieId: String,
                        completionHandler: @escaping (MovieDetails?,Error?) -> Void) -> Void {
        
        var headers:[String: String] = [
          "accept": "application/json",
          "Authorization": "Bearer \(Constants.apiAuthorization)"
        ]
        
        let httpHeaders = HTTPHeaders(headers)
        
        
        
        let url = URL(string: "\(Constants.movieDetailsUrl)\(movieId)")!
        
        AF.request(url,method: .get,headers: httpHeaders).response { response in
            if let data = response.data{
                let movieList = try? JSONDecoder().decode(MovieDetails.self, from: data)
                    completionHandler(movieList,nil)
            }else{
                completionHandler(nil,response.error)
            }
           }
        
    }
    

}

