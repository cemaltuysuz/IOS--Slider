//
//  Resource.swift
//  AutoSliderExample
//
//  Created by cemal tüysüz on 3.03.2022.
//

import Foundation

class Resource<T : Codable> {
    
    func fetchData(urlString: String, completion: @escaping (Result<T,Error>) -> Void){
        guard let url = URL(string: urlString) else { return }
        
        // or throw an error
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { completion(.failure(error)); return }
            completion( Result{ try JSONDecoder().decode(T.self, from: data!) })
        }.resume()
    }
}
