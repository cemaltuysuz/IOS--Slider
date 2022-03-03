//
//  MainProtocols.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

protocol ViewToPresenterMainProtocol {
    var view:PresenterToViewMainProtocol? {get set}
    var interactor:PresenterToInteracotrMainProtocol? {get set}
    func getNews()
}

protocol PresenterToInteracotrMainProtocol {
    var presenter:InteractorToPresenterMainProtocol? {get set}
    func getNews()
}

protocol InteractorToPresenterMainProtocol {
    func featuredNews(articles:[Article])
    func news(articles:[Article])
}

protocol PresenterToViewMainProtocol {
    func featuredNews(articles:[Article])
    func news(articles:[Article])
    
}

protocol PresenterToRouterMainProtocol {
    static func createModule(ref:ViewController)
}
