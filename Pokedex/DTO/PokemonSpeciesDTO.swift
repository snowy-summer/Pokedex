//
//  PokemonSpeciesDTO.swift
//  Pokedex
//
//  Created by 최승범 on 7/21/24.
//

import Foundation

struct PokemonSpeciesDTO: Decodable {
    let names: [Name]
    let genera: [Genera]
    let flavorTextEntries: [FlavorText]
    
    enum CodingKeys: String, CodingKey {
        case names
        case genera
        case flavorTextEntries = "flavor_text_entries"
    }
}

// 국가별 포켓몬 이름
struct Name: Decodable {
    let language: Language
    let name: String
}

// 포켓몬 종류 설명
// 예시) 씨앗 포켓몬
struct Genera: Decodable {
    let genus: String
    let language: Language
}

// 포켓몬 설명
struct FlavorText: Decodable {
    let flavorText: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct Language: Decodable {
    let name: String
}


