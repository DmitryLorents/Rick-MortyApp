//
//  ParsingModel.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 12.11.2023.
//

import Foundation

// MARK: - RickAndMorty
struct Episodes: Codable {
//    let info: Info
    let results: [Results]
}

//// MARK: - Info
//struct Info: Codable {
//    let count, pages: Int
//    let next: String
//    let prev: String?
//}

// MARK: - Result
struct Results: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
