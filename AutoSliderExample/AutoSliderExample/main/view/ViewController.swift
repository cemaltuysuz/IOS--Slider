//
//  ViewController.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 2.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    var featuredNews:[Article]?
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    var news:[Article]?
    
    var presenter: ViewToPresenterMainProtocol?
    @IBOutlet weak var featuredPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        MainRouter.createModule(ref: self)
        presenter?.getNews()
        
        
    }
    
    func setupUI(){
        self.news = [Article]()
        self.featuredNews = [Article]()
        
        self.featuredCollectionView.delegate = self
        self.featuredCollectionView.dataSource = self
        
        self.newsCollectionView.delegate = self
        self.newsCollectionView.dataSource = self
    }
}

extension ViewController : PresenterToViewMainProtocol {
    
    func featuredNews(articles: [Article]) {
        DispatchQueue.main.async {
            self.featuredNews = articles
            self.featuredCollectionView.reloadData()
            self.featuredPageControl.numberOfPages = articles.count
        }
    }
    
    func news(articles: [Article]) {
        DispatchQueue.main.async {
            self.news = articles
            self.newsCollectionView.reloadData()
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.featuredCollectionView {
            return featuredNews?.count ?? 0
        }
        return news?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.featuredCollectionView {
            let current = featuredNews![indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCollectionCell", for: indexPath) as! FeaturedCollectionViewCell
            cell.configue(article: current)
            
            return cell
        }
        
        let current = news![indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCollectionCell", for: indexPath) as! NewsCollectionViewCell
        cell.configure(article: current)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.featuredCollectionView {
            let offSet = scrollView.contentOffset.x
            let width = scrollView.frame.width
            let horizontalCenter = width / 2
            
            self.featuredPageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
        }
    }
}
