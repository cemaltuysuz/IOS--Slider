//
//  ViewController.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 2.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: ViewToPresenterMainProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainRouter.createModule(ref: self)
        
        presenter?.getNews()
    }


}

extension ViewController : PresenterToViewMainProtocol {
    
    func featuredNews(articles: [Article]) {
        
    }
}

