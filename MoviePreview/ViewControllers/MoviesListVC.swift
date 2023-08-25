//
//  MoviesListVC.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit
import ProgressHUD

class MoviesListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let apiManager = APIManager()
    var listOfMovies:[Result] = []
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()
    }

    func fetchData(){
        ProgressHUD.show()
        let parameters:[String:String] = ["language": "en-US",
                          "page":String(pageNumber)]
        
        apiManager.popularMovies(parameters: parameters){
            response,error in
            
            if let error = error{return}
            
            ProgressHUD.dismiss()
            if(self.pageNumber == 1){
                self.listOfMovies = response?.results ?? []
                self.pageNumber = self.pageNumber + 1
            }else{
                self.listOfMovies.append(contentsOf: response?.results ?? [])
                self.pageNumber = self.pageNumber + 1
            }
            
            self.tableView.reloadData()
        }
        
    }

}




extension MoviesListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListCell", for: indexPath) as? MoviesListCell{
            
            cell.titleLabel.text = listOfMovies[indexPath.row].title
            return cell
        }
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = self.listOfMovies[indexPath.row].id
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC
        vc?.movieId = String(id)
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc ?? UIViewController(),animated: true)
        
    }
    
}
