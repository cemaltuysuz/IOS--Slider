//
//  MainInteractor.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class MainInteractor : PresenterToInteracotrMainProtocol {
    var presenter: InteractorToPresenterMainProtocol?
    
    var specialCount = 5
    
    func getNews() {
        Resource<NewsResponse>().fetchData(
            urlString: RequestBuilder
                .getCountryRequest(countryCode: "tr"), completion: { (result:Result<NewsResponse,Error>) in
                    
                    switch result {
                    case .success(let success):
                        if var articles = success.articles, articles.count > 0 {
                            var featuredNews = [Article]()
                            
                            for i in 1...self.specialCount {
                                featuredNews.append(articles[i])
                                articles.remove(at: i)
                            }
                            self.presenter?.news(articles: articles)
                            self.presenter?.featuredNews(articles: featuredNews)
                        }
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
       })
    }
}
