//
//  MockPokedexData.swift
//  PokedexTests
//
//  Created by 최승범 on 7/19/24.
//

import Foundation

struct MockPokedexData {
    
    let pokedexData = PokedexDTO(count: 1302,
                          next:  "https://pokeapi.co/api/v2/pokemon?offset=2&limit=2",
                          previous: nil,
                          results: [
                            PokedexListNamedElementDTO(name: "bulbasaur",
                                                       url: "https://pokeapi.co/api/v2/pokemon/1/"),
                            PokedexListNamedElementDTO(name: "ivysaur",
                                                       url: "https://pokeapi.co/api/v2/pokemon/2/")
                          ]
    )
    
    func mockData() -> Data? {
        
        var data: Data?
        
        if let path = Bundle.main.path(forResource: "pokedexMock", ofType: "json"),
           let jsonString = try? String(contentsOfFile: path) {
            data = jsonString.data(using: .utf8)
        }
        
        return data
    }
}
