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
    
    var currentItem:Int!
    var autoSliderTimer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        MainRouter.createModule(ref: self)
        presenter?.getNews()
        
    }
    
    func setupUI(){
        currentItem = 0
        self.news = [Article]()
        self.featuredNews = [Article]()
        
        self.featuredCollectionView.delegate = self
        self.featuredCollectionView.dataSource = self
        
        self.newsCollectionView.delegate = self
        self.newsCollectionView.dataSource = self
        
        self.featuredPageControl.addTarget(self, action: #selector(self.onDidTap), for: .touchUpInside)
        
    }
}

extension ViewController : PresenterToViewMainProtocol {
    
    func featuredNews(articles: [Article]) {
        DispatchQueue.main.async {
            self.featuredNews = articles
            self.featuredCollectionView.reloadData()
            self.featuredPageControl.numberOfPages = articles.count
            self.startAutoSlider()
        }
    }
    
    func news(articles: [Article]) {
        DispatchQueue.main.async {
            self.news = articles
            self.newsCollectionView.reloadData()
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, FeaturedCollectionCellProtocol {
    
    func onLongClick(state:Bool) {
        if state {
            self.stopAutoSlider()
        }else {
            self.startAutoSlider()
        }
    }
    
    func onClick(article: Article) {
        print("title : \(article.title!)")
    }
    
    
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
            cell.delegate = self
            
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
            
            let page = Int(offSet + horizontalCenter) / Int(width)
            self.featuredPageControl.currentPage = page
            self.currentItem = page
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.stopAutoSlider()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.startAutoSlider()
    }
}

extension ViewController {
    
    func startAutoSlider(){
        self.autoSliderTimer?.invalidate()
        self.autoSliderTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.scrollItem), userInfo: nil, repeats: true)
        print("is started")
    }
    
    func stopAutoSlider(){
        print("is invalidate")
        self.autoSliderTimer?.invalidate()
    }
    
    
    @objc func scrollItem() {
        print("Current item:\(currentItem!) and list size = \(self.featuredNews!.count)")
            if currentItem != featuredNews!.count - 1 {
                
                let nextItem: IndexPath = IndexPath(item: self.currentItem! + 1, section: 0)
                self.featuredCollectionView.scrollToItem(at: nextItem, at: .right, animated: true)
            }else {
                let firstItem: IndexPath = IndexPath(item: 0, section: 0)
                self.featuredCollectionView.scrollToItem(at: firstItem, at: .left, animated: true)
            }
        }
    
    @objc func onDidTap(){
        if self.autoSliderTimer != nil {
            if self.autoSliderTimer!.isValid {
                self.stopAutoSlider()
            }else {
                self.startAutoSlider()
            }
        }else{
            self.startAutoSlider()
        }
    }
}
