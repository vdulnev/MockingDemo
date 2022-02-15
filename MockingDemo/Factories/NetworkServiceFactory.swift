//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Viacheslav Dulnev on 11.02.2022.
//

import Foundation

class NetworkServiceFactory {
    static func create() -> NetworkService {
        let env = ProcessInfo.processInfo.environment["ENV"]
        
        let webService: NetworkService = (env == "TEST") ? MockNetworkService() : Webservice()
        
        return webService
    }
}
