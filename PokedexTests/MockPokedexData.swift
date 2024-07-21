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
                            PokedexListNamedElementDTO(name: "bulbasaur"),
                            PokedexListNamedElementDTO(name: "ivysaur")
                          ]
    )
    
    func mockData() -> Data? {
        
        guard let path = Bundle.main.path(forResource: "PokedexMock", ofType: "json") else {
            print("json 파일 로딩 오류")
            return nil
        }
        
        guard let jsonString = try? String(contentsOfFile: path) else {
            print("string 추출 오류")
            return nil
        }
         
        guard let data = jsonString.data(using: .utf8) else {
            print("string -> data변환 오류")
            return nil
        }
        
        return data
    }
}
