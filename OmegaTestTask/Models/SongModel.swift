//
//  SongModel.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 03.10.2021.
//

import Foundation

struct SongModel: Decodable, Equatable {
    let results: [Song]
}

struct Song: Decodable, Equatable {
    let trackName: String?
}

