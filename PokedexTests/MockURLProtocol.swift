//
//  MockURLProtocol.swift
//  PokedexTests
//
//  Created by 최승범 on 7/19/24.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data?))?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Request handler is not set.")
        }
        
        let (response, data) = handler(request)
        
        self.client?.urlProtocol(self,
                                 didReceive: response,
                                 cacheStoragePolicy: .notAllowed)
        if let data = data {
            self.client?.urlProtocol(self,
                                     didLoad: data)
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {
    }
}
