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
    var height: Double = 0.0
    var weight: Double = 0.0
    var types: [PokemonTypeDTO] = []
    var sprites: Sprite = Sprite(frontDefault: "",
                                 other: OtherImages(officialArtWork: OfficialArtWork(frontDefault: "")))
    var stats: [PokemonStat] = []
    var abilities: [PokemonAbility] = []

}

struct PokemonTypeDTO: Decodable {
    let slot: Int
    let type: PokedexListNamedElementDTO
}

struct PokemonAbility: Decodable {
    let ability: Ability
    let isHidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
    }
}

struct Ability: Decodable {
    var name: String
    let url: String
}

struct PokemonStat: Decodable {
    let baseStat: Int
    let statName: PokemonStatName
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case statName = "stat"
    }
}

struct PokemonStatName: Decodable {
    let name: String
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
