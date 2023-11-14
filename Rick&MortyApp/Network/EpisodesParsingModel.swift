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
//MARK: - JSON example

/*
 {
    "info":{
       "count":51,
       "pages":3,
       "next":"https://rickandmortyapi.com/api/episode?page=2",
       "prev":null
    },
    "results":[
       {
          "id":1,
          "name":"Pilot",
          "air_date":"December 2, 2013",
          "episode":"S01E01",
          "characters":[
             "https://rickandmortyapi.com/api/character/1",
             "https://rickandmortyapi.com/api/character/2",
             "https://rickandmortyapi.com/api/character/35",
             "https://rickandmortyapi.com/api/character/38",
             "https://rickandmortyapi.com/api/character/62",
             "https://rickandmortyapi.com/api/character/92",
             "https://rickandmortyapi.com/api/character/127",
             "https://rickandmortyapi.com/api/character/144",
             "https://rickandmortyapi.com/api/character/158",
             "https://rickandmortyapi.com/api/character/175",
             "https://rickandmortyapi.com/api/character/179",
             "https://rickandmortyapi.com/api/character/181",
             "https://rickandmortyapi.com/api/character/239",
             "https://rickandmortyapi.com/api/character/249",
             "https://rickandmortyapi.com/api/character/271",
             "https://rickandmortyapi.com/api/character/338",
             "https://rickandmortyapi.com/api/character/394",
             "https://rickandmortyapi.com/api/character/395",
             "https://rickandmortyapi.com/api/character/435"
          ],
          "url":"https://rickandmortyapi.com/api/episode/1",
          "created":"2017-11-10T12:56:33.798Z"
       },
 */
