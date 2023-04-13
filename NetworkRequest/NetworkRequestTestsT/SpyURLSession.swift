//
//  SpyURLSession.swift
//  NetworkRequestTests
//
//  Created by Carlos Paredes on 13/4/23.
//

@testable import NetworkRequest
import Foundation

private class DummyURLSessionDataTask: URLSessionDataTask { override func resume() {
}
}
class SpyURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler: [(Data?, URLResponse?, Error?) -> Void] = []
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return DummyURLSessionDataTask()
    }
}

