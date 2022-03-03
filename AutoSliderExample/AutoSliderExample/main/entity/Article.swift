//
//  Article.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

struct Article : Codable {
    
    var source:Source?
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    
    init(source: Source? = nil, author: String? = nil, title: String? = nil, description: String? = nil, url: String? = nil, urlToImage: String? = nil, publishedAt: String? = nil, content: String? = nil) {
       self.source = source
       self.author = author
       self.title = title
       self.description = description
       self.url = url
       self.urlToImage = urlToImage
       self.publishedAt = publishedAt
       self.content = content
   }
}
