//
//  MainPresenter.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class MainPresenter : ViewToPresenterMainProtocol, InteractorToPresenterMainProtocol {
    
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteracotrMainProtocol?
    
    func getNews() {
        interactor?.getNews()
    }
    
    func featuredNews(articles: [Article]) {
        view?.featuredNews(articles: articles)
    }
    
    func news(articles: [Article]) {
        view?.news(articles: articles)
    }
}
