//
//  PokemonType.swift
//  Pokedex
//
//  Created by 최승범 on 7/19/24.
//

import Foundation

enum PokemonType: Int, CaseIterable {
    case normal
    case fight
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
    case electricity
    case esper
    case ice
    case dragon
    case dark
    case fairy
    
    
    var name: String {
        switch self {
        case .normal: return "노말"
        case .fight: return "격투"
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
        case .electricity: return "전기"
        case .esper: return "에스퍼"
        case .ice: return "얼음"
        case .dragon: return "드래곤"
        case .dark: return "악"
        case .fairy: return "페어리"
        }
    }
    
    var symbolName: String {
        switch self {
        case .normal: return "normalSymbol"
        case .fight: return "fightSymbol"
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
        case .electricity: return "electricitySymbol"
        case .esper: return "esperSymbol"
        case .ice: return "iceSymbol"
        case .dragon: return "dragonSymbol"
        case .dark: return "darkSymbol"
        case .fairy: return "fairySymbol"
        }
    }
}
