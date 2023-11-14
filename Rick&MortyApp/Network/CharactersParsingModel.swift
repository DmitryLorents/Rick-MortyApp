//
//  CharactersParsingModel.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 13.11.2023.
//

import Foundation

// MARK: - Character
struct CharacterData: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

//MARK: - JSON example
/*
 {
    "id":46,
    "name":"Bill",
    "status":"unknown",
    "species":"Animal",
    "type":"Dog",
    "gender":"Male",
    "origin":{
       "name":"Earth (Replacement Dimension)",
       "url":"https://rickandmortyapi.com/api/location/20"
    },
    "location":{
       "name":"unknown",
       "url":""
    },
    "image":"https://rickandmortyapi.com/api/character/avatar/46.jpeg",
    "episode":[
       "https://rickandmortyapi.com/api/episode/2"
    ],
    "url":"https://rickandmortyapi.com/api/character/46",
    "created":"2017-11-05T10:24:38.089Z"
 }
 
 */
