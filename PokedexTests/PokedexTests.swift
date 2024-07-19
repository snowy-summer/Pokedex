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
    private var mockPokedexData: MockPokedexData!
    
    override func setUp() {
        super.setUp()
        mockPokedexData = MockPokedexData()
    }
    
    
    override func tearDown() {
        super.tearDown()
        cancellables.removeAll()
        mockPokedexData = nil
    }
    
    func test_네트워크_Mock() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = Session(configuration: config)
        let networkManager = NetworkManager(session: session)
        
        // Mock 데이터 주입
        MockURLProtocol.requestHandler = { [weak self] request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            let data = self?.mockPokedexData.mockData()
            
            return (response, data)
        }
        
        
        let expectation = self.expectation(description: "Mock 네트워크 통신")
        
        // Mock데이터 비교
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: 0, end: 2))
        .sink { completion in
            print ("completion: \(completion)")
        } receiveValue: { [weak self] data in
            //결과
            expectation.fulfill()
            XCTAssertEqual(data,
                           self?.mockPokedexData.pokedexData)
        }
        .store(in: &cancellables)
        
        waitForExpectations(timeout: 5.0)
    }
    
    func test_네트워크_실제통신() {
        
        //준비
        let networkManager = NetworkManager()
        let expectation = self.expectation(description: "Mock 네트워크 통신")
        
        // 실행
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: 0, end: 2))
        .sink { completion in
            print ("completion: \(completion)")
        } receiveValue: { [weak self] data in
            // 결과
            expectation.fulfill()
            XCTAssertEqual(data,
                           self?.mockPokedexData.pokedexData)
        }
        .store(in: &cancellables)
        
        waitForExpectations(timeout: 5.0)
        
    }
    
    func test_네트워크_잘못된응답() {
        
        //준비
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = Session(configuration: config)
        let networkManager = NetworkManager(session: session)
        
        
        MockURLProtocol.requestHandler = { [weak self] request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            let data = self?.mockPokedexData.mockData()
            
            return (response, data)
        }
        
        let expectation = self.expectation(description: "네트워크 통신 잘못된 응답")
        
        //실행
        networkManager.fetchData(PokedexDTO.self,
                                 router: .pokedex(start: 0, end: 2))
        .sink { completion in
            switch completion {
            case .finished:
                XCTFail("잘못된 응답 failure를 받아야 하지만 finished를 받음")
            case .failure(let error):
                XCTAssertEqual(error as? NetworkError, NetworkError.invalidResponse)
                expectation.fulfill()
            }
        } receiveValue: { _ in
            XCTFail("데이터가 존재하지 않아야 함")
        }
        .store(in: &cancellables)
        
        waitForExpectations(timeout: 5.0)
    }
    
    
}
