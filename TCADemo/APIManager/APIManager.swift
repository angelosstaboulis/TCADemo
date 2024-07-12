//
//  APIManager.swift
//  TCADemo
//
//  Created by Angelos Staboulis on 11/7/24.
//

import Foundation
import Alamofire
actor APIManager{
    func fetchOPAPPropo(endpoint:String) async -> Model{
        return await withCheckedContinuation { continuation in
            guard let baseURL = URL(string:"https://api.opap.gr/program/v1.0/3100/visual-draw/20185") else{
                return
            }
            guard let request = RequestBuilder(path: endpoint)
                .makeRequest(baseURL: baseURL) else{
                return
            }
            AF.request(request).response { dataResponse in
                switch (dataResponse.result){
                case .success(_):
                    do{
                        guard let responseData = dataResponse.data else{
                            return
                        }
                        let decode = try JSONDecoder().decode(Model.self, from: responseData)
                        continuation.resume(returning: decode)
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                case .failure(let error):
                    debugPrint("something went wrong=",error.localizedDescription)
                    
                }
            }
        }
       
    }
}
