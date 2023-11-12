//
//  NetworkManager.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 12.11.2023.
//

import Foundation

enum ParsingErrors: Error {
    case decodingProblem
    
}

final class  NetworkManager {
    var urlString: String!
    let decoder = JSONDecoder()

    
    func getCountriesInfo(CCA2: String?, completion: @escaping (Result<RickAndMorty, Error>) -> () ) {
        //set urlString depending on CCA2
        switch CCA2 {
        case.none:
            urlString =  "https://restcountries.com/v3.1/all"
            
        case.some(let CCA2Text):
            urlString = "https://restcountries.com/v3.1/alpha/" + CCA2Text
        }
        guard let url = URL(string: urlString) else {
            print("Incorrect URL")
            return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let self else {
                print("No self")
                return }
            guard let downloadedData = data, error == nil else {
                completion(.failure(error!))
                return}
            
            
            guard let parsedData = try? self.decoder.decode(Countries.self, from: downloadedData) else {
                completion(.failure(error ?? ParsingErrors.decodingProblem))
                return}
            completion(.success(parsedData))
        }.resume()
    }
    
    func sorting(_ countries: Countries) -> [String: Countries] {
        
        //creeate an array of all possible regions
        var regions = [String]()
        Region.allCases.forEach { region in
            regions.append(region.rawValue)
        }
        //iterate each country in incoming "countries" and add each of them  into corresponding array in output dictionary
        var outputDictionary = [String: Countries]()
        countries.forEach { country in
            let  key = country.region.rawValue
            if var existingArray = outputDictionary[key] {
                existingArray.append(country)
                outputDictionary.updateValue(existingArray, forKey: key)
            } else {
                let newArray = [country]
                outputDictionary.updateValue(newArray, forKey: key)
            }
        }
        //sort each country array by alphabet
        for (key, value) in outputDictionary {
            let newValue = value.sorted(by: {country1, country2 in
                country1.name.common < country2.name.common
            })
            outputDictionary.updateValue(newValue, forKey: key)
        }
        
        return outputDictionary
        }
    
}
