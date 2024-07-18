//
//  QueryOfPokedex.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation

struct QueryOfPokedex: URLQueryAble {
    let offset: Int
    let limit: Int
    
    init(offset: Int, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
    
    func queryItem() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        queryItems.append(URLQueryItem(name: "offset",
                                       value: String(offset)))
        queryItems.append(URLQueryItem(name: "limit",
                                       value: String(limit)))
        return queryItems
        
    }
    
}
