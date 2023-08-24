//
//  MoviesListVC.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit

class MoviesListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let apiManager = APIManager()
    var pageNumber = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData(){
        
        let parameters:[String:String] = ["language": "en-US",
                          "page":pageNumber]
        
        apiManager.popularMovies(parameters: parameters){
            response,error in
            
            print("got response \(response)")
            print("Got error\(error)")
            
        }
        
    }

}
