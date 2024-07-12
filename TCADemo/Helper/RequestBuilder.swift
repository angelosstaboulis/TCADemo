//
//  RequestBuilder.swift
//  TCADemo
//
//  Created by Angelos Staboulis on 11/7/24.
//

import Foundation
struct RequestBuilder {
    var urlComponents: URLComponents
    
    private init(urlComponents: URLComponents) {
        self.urlComponents = urlComponents
    }
    
    init(path: String) {
        var components = URLComponents()
        components.path = path
        self.init(urlComponents: components)
    }
}
extension RequestBuilder {
    func makeRequest(baseURL: URL) -> URLRequest? {
        guard let finalURL = urlComponents.url(relativeTo: baseURL) else {
            return nil
        }
        return URLRequest(url: finalURL)
    }
}
