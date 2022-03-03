//
//  Source.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

struct Source : Codable {
    
    var id:String?
    var name:String?
    
    init(id:String, name:String){
        self.id = id
        self.name = name
    }
}
