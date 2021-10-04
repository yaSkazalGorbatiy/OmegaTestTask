//
//  AlbumModel.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 01.10.2021.
//

import Foundation

struct AlbumModel: Decodable, Equatable {
    let results: [Album]
}

struct Album: Decodable, Equatable {
    let artistName: String
    let collectionName: String
    let trackCount: Int
    let artworkUrl100: String?
    let releaseDate: String
    let collectionId: Int
}
