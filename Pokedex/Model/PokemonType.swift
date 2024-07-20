//
//  PokemonType.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import SwiftUI

enum PokemonType: String, CaseIterable {
    case normal
    case fighting
    case fly
    case poison
    case ground
    case rock
    case bug
    case ghost
    case metal
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    
    
    var name: String {
        switch self {
        case .normal: return "노말"
        case .fighting: return "격투"
        case .fly: return "비행"
        case .poison: return "독"
        case .ground: return "땅"
        case .rock: return "바위"
        case .bug: return "벌레"
        case .ghost: return "고스트"
        case .metal: return "강철"
        case .fire: return "불꽃"
        case .water: return "물"
        case .grass: return "풀"
        case .electric: return "전기"
        case .psychic: return "에스퍼"
        case .ice: return "얼음"
        case .dragon: return "드래곤"
        case .dark: return "악"
        case .fairy: return "페어리"
        }
    }
    
    var symbolName: String {
        switch self {
        case .normal: return "normalSymbol"
        case .fighting: return "fightingSymbol"
        case .fly: return "flySymbol"
        case .poison: return "poisonSymbol"
        case .ground: return "groundSymbol"
        case .rock: return "rockSymbol"
        case .bug: return "bugSymbol"
        case .ghost: return "ghostSymbol"
        case .metal: return "metalSymbol"
        case .fire: return "fireSymbol"
        case .water: return "waterSymbol"
        case .grass: return "grassSymbol"
        case .electric: return "electricSymbol"
        case .psychic: return "esperSymbol"
        case .ice: return "iceSymbol"
        case .dragon: return "dragonSymbol"
        case .dark: return "darkSymbol"
        case .fairy: return "fairySymbol"
        }
    }
    
    var color: Color {
        switch self {
        case .normal: return .normal
        case .fighting: return .fighting
        case .fly: return .fly
        case .poison: return .poison
        case .ground: return .ground
        case .rock: return .rock
        case .bug: return .bug
        case .ghost: return .ghost
        case .metal: return .metal
        case .fire: return .fire
        case .water: return .water
        case .grass: return .grass
        case .electric: return .electric
        case .psychic: return .esper
        case .ice: return .ice
        case .dragon: return .dragon
        case .dark: return .dark
        case .fairy: return .fairy
        }
    }
}
