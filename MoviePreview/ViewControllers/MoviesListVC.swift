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
    @IBOutlet weak var toggleButton: UIButton!
    
    
    let apiManager = APIManager()
    var listOfMovies:[Result] = []
    var pageNumber = 1
    var isLoading = false
    var isDetailedView = true

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()
    }

    func fetchData(){
        ProgressHUD.show()
        self.isLoading = true
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
            self.isLoading = false
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func toggleViewsPressed(_ sender: Any) {
        self.isDetailedView = !self.isDetailedView
        
        if(self.isDetailedView == true){
            self.toggleButton.setImage(UIImage(named: "tiles"), for: .normal)
        }else{
            self.toggleButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        }
        
        self.tableView.reloadData()
        
    }
    

}




extension MoviesListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isDetailedView){
            return listOfMovies.count
        }else{
            return listOfMovies.count/2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(isDetailedView){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListCell", for: indexPath) as? MoviesListCell{
                cell.UIActions(data: listOfMovies[indexPath.row])
                return cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoImagesCell", for: indexPath) as? TwoImagesCell{
                cell.UIChanges(dataOne: listOfMovies[indexPath.row*2], dataTwo: listOfMovies[(indexPath.row*2)+1])
                cell.imageOne = {
                    let id = self.listOfMovies[indexPath.row*2].id
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC
                    vc?.movieId = String(id)
                    vc?.modalPresentationStyle = .fullScreen
                    self.present(vc ?? UIViewController(),animated: true)
                }
                
                cell.imageTwo = {
                    let id = self.listOfMovies[(indexPath.row*2)+1].id
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC
                    vc?.movieId = String(id)
                    vc?.modalPresentationStyle = .fullScreen
                    self.present(vc ?? UIViewController(),animated: true)
                }
                return cell
            }
        }
        
        
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(isDetailedView){
            let id = self.listOfMovies[indexPath.row].id
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC
            vc?.movieId = String(id)
            vc?.modalPresentationStyle = .fullScreen
            self.present(vc ?? UIViewController(),animated: true)
        }else{
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let scrollViewHeight = scrollView.frame.size.height
            let contentHeight = scrollView.contentSize.height
            let offsetY = scrollView.contentOffset.y
            
            if offsetY > contentHeight - scrollViewHeight {
                // Scrolling is close to the bottom
                
                if(!isLoading){
                    self.fetchData()
                }
                
                // You can trigger actions like loading more data here
            }
        }
    
}
