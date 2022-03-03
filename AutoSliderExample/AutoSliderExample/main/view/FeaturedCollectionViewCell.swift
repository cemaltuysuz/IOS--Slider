//
//  FeaturedCollectionViewCell.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import UIKit
import Kingfisher

class FeaturedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var articlePhotoImgView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    func configue (article:Article) {
        if let urlString = article.urlToImage, let url = URL(string: urlString), let title = article.title {
            self.articlePhotoImgView.kf.setImage(with: url)
            self.articleTitleLabel.text = title
        }
    }
    
}
