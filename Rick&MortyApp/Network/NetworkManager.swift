//
//  NetworkManager.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 12.11.2023.
//

import UIKit

enum ParsingErrors: Error {
    case decodingProblem
    
}

final class  NetworkManager {
    //MARK: - Singletone
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - Parameters
    var urlString: String!
    let decoder = JSONDecoder()
    
    //MARK: - Methods
    private func getData <T: Codable> (urlString: String, parseProtocol: T.Type, completion: @escaping (Result<T, Error>) -> () ) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let self = self else { return }
            guard let downloadedData = data, error == nil else {
                completion(.failure(error!))
                return}
            
            
            guard let parsedData = try? self.decoder.decode(parseProtocol, from: downloadedData) else {
                completion(.failure(error!))
                return}
            completion(.success(parsedData))
        }.resume()
    }
    
    func getEpisodes(completion: @escaping (Result<Episodes, Error>) -> () ) {
        let urlString = "https://rickandmortyapi.com/api/episode"
        getData(urlString: urlString, parseProtocol: Episodes.self, completion: completion)
    }
    
    func getCharacter(with urlString: String, completion: @escaping (Result<CharacterData, Error>) -> () ) {
        getData(urlString: urlString, parseProtocol: CharacterData.self, completion: completion)
    }
    
}
