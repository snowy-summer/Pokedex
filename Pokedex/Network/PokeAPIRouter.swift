//
//  PokeAPIRouter.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation
import Alamofire

enum PokeAPIRouter: URLRequestConvertible {
    
    case pokedex(start: Int, end: Int)
    case pokemon(dexNum: Int)
    
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
            
        case .pokemon(let num):
            return "/api/v2/pokemon/\(num)"
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
