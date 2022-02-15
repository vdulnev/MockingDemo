//
//  MockNetworkService.swift
//  MockingDemoUITests
//
//  Created by Viacheslav Dulnev on 11.02.2022.
//

import Foundation

class MockNetworkService: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if (username == "user" && password == "pwd") {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
    
    
}
