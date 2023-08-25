//
//  ShadowImageView.swift
//  MoviePreview
//
//  Created by Osama Arshad on 25/08/2023.
//

import Foundation
import UIKit

class ShadowedImageView: UIView {
    private let shadowLayer = CALayer()
    private let imageView = UIImageView()

    var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            updateShadow()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = false

        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowOffset = CGSize(width: 0, height: 2)
        shadowLayer.shadowRadius = 4
        shadowLayer.masksToBounds = false
        layer.insertSublayer(shadowLayer, at: 0)
        
        updateShadow()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        shadowLayer.frame = imageView.frame
        updateShadow()
    }

    private func updateShadow() {
        if let imageSize = imageView.image?.size {
            shadowLayer.shadowPath = UIBezierPath(rect: CGRect(origin: .zero, size: imageSize)).cgPath
        }
    }
}
