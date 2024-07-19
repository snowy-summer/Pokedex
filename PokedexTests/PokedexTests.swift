//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by 최승범 on 7/19/24.
//

import XCTest
import Combine
import Alamofire

final class PokedexTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []
    
    override class func setUp() {
        super.setUp()
        
    }
    
    func test_네트워크_Mock() {
        let mockPokedexData = MockPokedexData()
        
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = Session(configuration: config)
        
        // Mock 데이터 주입
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            let data = mockPokedexData.mockData()
            
            return (response, data)
        }
        
        let networkManager = NetworkManager(session: session)
        
        
        // Mock데이터 비교
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: 0, end: 2))
        .sink { completion in
            
        } receiveValue: { data in
            XCTAssertEqual(data,
                           mockPokedexData.pokedexData)
        }
        .store(in: &cancellables)
    }
    
    

}
