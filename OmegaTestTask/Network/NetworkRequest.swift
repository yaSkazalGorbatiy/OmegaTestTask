//
//  NetworkService.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 01.10.2021.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func requestAlbums(nameAlbum: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let urlString = "https://itunes.apple.com/search?term=\(nameAlbum)&entity=album&attribute=albumTerm"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
                print(data)
            }
        }
        .resume()
    }
}
