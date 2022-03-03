//
//  MainRouter.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class MainRouter : PresenterToRouterMainProtocol {
    
    static func createModule(ref: ViewController) {
        let p = MainPresenter()
        
        ref.presenter = p
        ref.presenter?.view = ref
        ref.presenter?.interactor = MainInteractor()
        ref.presenter?.interactor?.presenter = p
    }
}
