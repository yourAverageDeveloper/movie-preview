//
//  MoviesListCell.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var starOneView: UIImageView!
    
    @IBOutlet weak var starTwoView: UIImageView!
    
    @IBOutlet weak var starthreeView: UIImageView!
    
    @IBOutlet weak var starFourView: UIImageView!
    
    @IBOutlet weak var starFiveView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func UIActions(data:Result){
        self.cardView.layer.cornerRadius = 10
        self.titleLabel.text = data.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
