//
//  MainInteractor.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class MainInteractor : PresenterToInteracotrMainProtocol {
    var presenter: InteractorToPresenterMainProtocol?
    
    func getNews() {
        Resource<NewsResponse>().fetchData(
            urlString: RequestBuilder
                .getCountryRequest(countryCode: "tr"), completion: { (result:Result<NewsResponse,Error>) in
                    
                    switch result {
                    case .success(let success):
                        print(success.status)
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
       })
    }
}
