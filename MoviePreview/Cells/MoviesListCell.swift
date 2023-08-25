//
//  MoviesListCell.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit
import SDWebImage

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starOneView: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func UIActions(data:Result){
        self.cardView.layer.cornerRadius = 10
        let year =  String(data.releaseDate.prefix(4))
        self.titleLabel.text = "\(data.title) (\(year))"
        self.ratingLabel.text = String(data.voteAverage)
        
        
        posterImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        posterImageView.sd_setImage(with: URL(string: "\(Constants.imageBaseUrl)\(data.posterPath )"))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
