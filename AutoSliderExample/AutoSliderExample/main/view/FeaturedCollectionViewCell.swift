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
    @IBOutlet weak var recognizerContainer: UIView!
    private var article:Article!
    
    var delegate:FeaturedCollectionCellProtocol?
    
    func configue (article:Article) {
        if let urlString = article.urlToImage, let url = URL(string: urlString), let title = article.title {
            self.articlePhotoImgView.kf.setImage(with: url)
            self.articleTitleLabel.text = title
            
            let longpressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.onLong(rec:)))
            self.contentView.addGestureRecognizer(longpressRecognizer)
        }
    }
    
    @objc
    func onLong(rec:UILongPressGestureRecognizer) {
        self.delegate?.onLongClick(state: rec.state == .began)
    }
}

protocol FeaturedCollectionCellProtocol {
    func onLongClick(state:Bool)
    func onClick(article:Article)
}
