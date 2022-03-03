//
//  NewsCollectionViewCell.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsPhotoImgView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextView: UITextView!
    
    
    func configure(article:Article) {
        if let photoUrl = article.urlToImage, let url = URL(string: photoUrl), let title = article.title, let description = article.description {
            self.newsPhotoImgView.kf.setImage(with: url)
            self.newsTitleLabel.text = title
            self.newsDescriptionTextView.text = description
        }
        
        
    }
    
}
