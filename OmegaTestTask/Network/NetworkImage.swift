//
//  NetworkImage.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 03.10.2021.
//

import Foundation

class NetworkImage {
    
    static let shared = NetworkImage()
    
    private init() {}
    
    func requestImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let urlString = urlString
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}


