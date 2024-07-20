//
//  PokemonDTO.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation

struct PokemonDTO: Decodable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var height: Int = 0
    var weight: Int = 0
    var types: [PokemonTypeDTO] = []
    var sprites: Sprite = Sprite(frontDefault: "",
                                 other: OtherImages(officialArtWork: OfficialArtWork(frontDefault: "")))
}

struct PokemonTypeDTO: Decodable {
    let slot: Int
    let type: PokedexListNamedElementDTO
}

struct Sprite: Decodable {
    let frontDefault: String
    let other: OtherImages
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
}

struct OtherImages: Decodable {
    let officialArtWork: OfficialArtWork
    
    enum CodingKeys: String, CodingKey {
        case officialArtWork = "official-artwork"
    }
}

struct OfficialArtWork: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
