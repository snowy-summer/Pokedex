//
//  PokeAPIRouter.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation
import Alamofire

enum PokeAPIRouter: URLRequestConvertible {
    
    case pokedex(start: Int, pageCount: Int)
    case pokemonInfo(dexNum: Int)
    case pokemonSpecies(dexNum: Int)
    case pokemonAbility(ablityNum: Int)
    
    var scheme: String {
        
        switch self {
        default:
            return "https"
        }
    }
    
    var host: String {
        
        return "pokeapi.co"
    }
    
    var path: String {
        
        switch self {
        case .pokedex:
            return "/api/v2/pokemon"
            
        case .pokemonInfo(let num):
            return "/api/v2/pokemon/\(num)"
            
        case .pokemonSpecies(let num):
            return "/api/v2/pokemon-species/\(num)"
        case .pokemonAbility(let num):
            return "/api/v2/ability/\(num)"
        }
    }
    
    var parameter: [URLQueryItem] {
        
        switch self {
        case .pokedex(let start, let end):
            return QueryOfPokedex(offset: start, limit: end).queryItem()
            
        default:
            return []
        }
    }
    
    var url: URL? {
        
        switch self {
        default:
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = path
            components.queryItems = parameter
            
            return components.url
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        default:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        guard let url = self.url else { throw NetworkError.invalidURL }
        let urlRequest = try URLRequest(url: url,
                                        method: self.method)
        
        return urlRequest
    }
}
