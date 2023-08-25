//
//  TwoImagesCell.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import UIKit
import SDWebImage

class TwoImagesCell: UITableViewCell {
    
    @IBOutlet weak var imageOneView: UIImageView!
    @IBOutlet weak var imageTwoView: UIImageView!
    @IBOutlet weak var imageOneRating: UILabel!
    @IBOutlet weak var imageTwoRating: UILabel!
    
    var imageOne: (() -> Void)?
    var imageTwo: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageOneTapped))
            imageOneView.addGestureRecognizer(tapGesture)
            imageOneView.isUserInteractionEnabled = true
        
        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(imageTwoTapped))
            imageTwoView.addGestureRecognizer(tapGestureTwo)
            imageTwoView.isUserInteractionEnabled = true
        
            }

    @objc func imageOneTapped() {
        imageOne?()
}
    @objc func imageTwoTapped() {
        imageTwo?()
}
    
    func UIChanges(dataOne:Result,dataTwo:Result){
        self.imageOneRating.text = String(dataOne.voteAverage)
        self.imageTwoRating.text = String(dataTwo.voteAverage)
        
        imageOneView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageOneView.sd_setImage(with: URL(string: "\(Constants.imageBaseUrl)\(dataOne.posterPath )"))
        
        imageTwoView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageTwoView.sd_setImage(with: URL(string: "\(Constants.imageBaseUrl)\(dataTwo.posterPath )"))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
