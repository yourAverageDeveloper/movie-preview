//
//  ViewController.swift
//  MoviePreview
//
//  Created by Osama Arshad on 24/08/2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    let apiManager = APIManager()
    var pageNumber = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callData()
    }

    func callData(){
        
        let parameters:[String:String] = ["language": "en-US",
                          "page":pageNumber]
        
        apiManager.popularMovies(parameters: parameters){
            response,error in
            
            print("got response \(response)")
            print("Got error\(error)")
            
        }
        
    }

}
