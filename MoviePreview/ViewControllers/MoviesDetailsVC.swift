//
//  MoviesDetailsVC.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit
import ProgressHUD

class MoviesDetailsVC: UIViewController {
    
    var movieId:String = ""
    let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData(){
        ProgressHUD.show()
        
        apiManager.movieDetails(movieId: movieId){
            response,error in
            ProgressHUD.dismiss()
            
            dump(response)
            
        }
        
    }
    

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
