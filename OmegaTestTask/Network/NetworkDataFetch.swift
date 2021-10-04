//
//  NetworkDataFetch.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 01.10.2021.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchAlbums(urlString: String, responce: @escaping (AlbumModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            
            case .success(let data):
                do {
                    let devices = try JSONDecoder().decode(AlbumModel.self, from: data)
                    responce(devices, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
               
            }
        }
    }
    
    func fetchSongs(urlString: String, responce: @escaping (SongModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            
            case .success(let data):
                do {
                    let devices = try JSONDecoder().decode(SongModel.self, from: data)
                    responce(devices, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
               
            }
        }
    }
}
