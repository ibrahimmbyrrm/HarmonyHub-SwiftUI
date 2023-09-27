//
//  NetworkManager.swift
//  HarmonyHub
//
//  Created by İbrahim Bayram on 1.08.2023.
//

import Foundation
import Alamofire

protocol NetworkService {
    func fetchData<T : Decodable>(type : EndPointItems<T>,completion : @escaping (Result<T,httpError>)->Void)
}

final class NetworkManager: NetworkService {
    
    func fetchData<T>(type: EndPointItems<T>, completion: @escaping (Result<T, httpError>) -> Void) where T : Decodable {
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        AF.request(url).responseDecodable(of : T.self) { response in
            if response.response?.statusCode == 200 {
                switch response.result {
                case .success(let decoded):
                    completion(.success(decoded))
                case .failure(_):
                    completion(.failure(.noConnection))
                }
            }else {
                completion(.failure(.invalidResponse))
            }
            
        }
    }
    
    
}
