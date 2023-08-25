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
        tableView.delegate = self
        tableView.dataSource = self
        
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




extension MoviesListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListCell", for: indexPath) as? MoviesListCell{
            return cell
        }
        
        return UITableViewCell()

    }
    
    
}
