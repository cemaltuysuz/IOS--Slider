//
//  Requests.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class RequestBuilder {
    
    static func getCountryRequest(countryCode:String) -> String{
        return "\(Constants.BASE_URL)/top-headlines?country=\(countryCode)&apiKey=\(Constants.API_KEY)"
    }
}
