//
//  OnboardingCollectionViewCell.swift
//  charity360
//
//  Created by user1 on 24/02/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(_ slide : OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
