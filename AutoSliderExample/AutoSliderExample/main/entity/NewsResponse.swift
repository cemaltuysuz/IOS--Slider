//
//  NewsResponseClass.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

struct NewsResponse : Codable {
    
    var status:String?
    var totalResults:Int?
    var articles:[Article]?
    
    init(status: String? = nil, totalResults: Int? = nil, articles: [Article]? = nil) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}
