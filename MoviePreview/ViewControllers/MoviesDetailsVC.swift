//
//  MoviesDetailsVC.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit
import ProgressHUD
import SDWebImage
import UIGradient

class MoviesDetailsVC: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movieId:String = ""
    var movieObject: MovieDetails?
    let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        view.backgroundColor = UIColor.fromGradientWithDirection(.bottomLeftToTopRight, frame: view.frame, colors: [UIColor(named: "backgroundColor")!,UIColor(named: "gradient")!])

        
    }
    
    func fetchData(){
        ProgressHUD.show()
        
        apiManager.movieDetails(movieId: movieId){
            response,error in
            ProgressHUD.dismiss()
            self.movieObject = response
            self.setupUI()
            
            dump(response)
            
        }
        
    }
    

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    func setupUI(){
        guard let runtime = movieObject?.runtime as? Int else {return}
        guard let rating = movieObject?.voteAverage as? Double else {return}
        
        if movieObject?.posterPath != nil{
            posterImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            posterImageView.sd_setImage(with: URL(string: "\(Constants.imageBaseUrl)\(movieObject?.posterPath ?? "")"))
        }
        
        if movieObject?.runtime != nil{
            self.durationLabel.text = "\(runtime) min"
        }
        
        if movieObject?.voteAverage != nil{
            
            self.durationLabel.text = "\(runtime) min"
            let formattedRating = String(format: "%.1f", rating)
            self.ratingLabel.text = "\(formattedRating)/10"
        }
        
        if (movieObject?.genres.count != 0){
            self.genreLabel.text = movieObject?.genres[0].name
        }
        
        if (movieObject?.title != nil){
            self.titleLabel.text = movieObject?.title
        }
        
        if (movieObject?.overview != nil){
            self.synopsisLabel.text = movieObject?.overview
            
            let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.lineSpacing = 12 // Adjust the value as needed
            let attributedString = NSAttributedString(string: self.synopsisLabel.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            self.synopsisLabel.attributedText = attributedString
        }
        
    }
    
}
