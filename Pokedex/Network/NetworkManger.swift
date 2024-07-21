//
//  NetworkManger.swift
//  Pokedex
//
//  Created by 최승범 on 7/18/24.
//

import Foundation
import Combine
import Alamofire

struct NetworkManager {
    
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func fetchData<T: Decodable>(_ object: T.Type,
                                 router: PokeAPIRouter) -> AnyPublisher<T, Error> {
        return Future { promise in
            session.request(router)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        promise(.success(data))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }.eraseToAnyPublisher()
    }
    
    func fetchUrlData<T: Decodable>(_ object: T.Type,
                                    url: String) -> AnyPublisher<T, Error> {
    
        return Future { promise in
            
            guard let url = URL(string: url) else {
              return promise(.failure(NetworkError.invalidURL))
            }
            
            session.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        promise(.success(data))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }.eraseToAnyPublisher()
        
    }
}
