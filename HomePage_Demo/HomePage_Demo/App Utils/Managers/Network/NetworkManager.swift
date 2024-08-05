//
//  NetworkManager.swift
//  Lucknow Super Giants
//
//  Created by Abhijeet Gawde on 07/02/23.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    func getHeaders(_ type: NetworkTokenType) -> [String:String]? {
        switch type {
        case .authorization:
            return [
                "content-type": "application/json"
            ]
        case .authenticationWithUserToken:
            return [
                "auth": "\(FirebaseModelConfig.sharedFirebaseConfig.apiAuthKey ?? "")",
                "usertoken": "\(UserDefaultsManager.shared.getUserToken() ?? "")",
                "content-type": "application/json"
            ]
        case .cleanAuthorization:
            return nil
        case .notificationAuth:
            return ["auth":"\(FirebaseModelConfig.sharedFirebaseConfig.notificationAuthKey ?? "")"]
        case .cookieAuth:
            return nil
        case .profileAuth:
            return nil
        case .xAccess:
            return nil
        case .loginAuth:
            return nil
        }
    }
    
    func makeRequest<T: Codable>(url: String,
                                 type: T.Type,
                                 headerType: NetworkTokenType = .cleanAuthorization,
                                 completion: @escaping(Result<T, NetworkErrors>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
      //  debugPrint("GET url : \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = getHeaders(headerType)
        
      print("Curl Request: \(request.curlString)")
      //  debugPrint("Header type: \(getHeaders(headerType))")
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.waitsForConnectivity = true
        sessionConfig.allowsConstrainedNetworkAccess = false
        sessionConfig.allowsExpensiveNetworkAccess = true
        
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(
            with: request) { data, response, error in
                
                guard error == nil else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.dataFailure))
                    return
                }
                
                guard response != nil else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let returnedResponse = try decoder.decode(T.self, from: data)
                    completion(.success(returnedResponse))
            //        debugPrint("returnedResponse: \(returnedResponse)")
                } catch {
                    debugPrint(error)
                    completion(.failure(.invalidResponse))
                    return
                }
                
            }
        
        task.resume()
    }
    
    func makePostRequest<Output: Codable, Input: Codable>(url: String,
                                                          type: Output.Type,
                                                          headerType: NetworkTokenType = .cleanAuthorization,
                                                          parameters: Input? = nil,
                                                          completion: @escaping(Result<Output, NetworkErrors>) -> Void){
            guard let url = URL(string: url) else {
                completion(.failure(.invalidUrl))
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.allHTTPHeaderFields = getHeaders(headerType)
            
            let jsonEncoder = JSONEncoder()
            let encodedData = try? jsonEncoder.encode(parameters.self)
            request.httpBody = encodedData
            
//            print("Curl Request: \(request.curlString)")
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.waitsForConnectivity = true
            sessionConfig.allowsConstrainedNetworkAccess = false
            sessionConfig.allowsExpensiveNetworkAccess = true
            
            let session = URLSession(configuration: sessionConfig)
            
            let task = session.dataTask(
                with: request) { data, response, error in
                    guard error == nil else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    
                    guard let data = data else {
                        completion(.failure(.dataFailure))
                        return
                    }
                    
                    guard response != nil else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    
                    let responsetoken = response as? HTTPURLResponse
                    if let token = responsetoken?.allHeaderFields["usertoken"] as? String {
                    //    print("User Token ------ \(token)")
                        UserDefaultsManager.shared.setUserToken(userToken: token)
                    }
                    
                    do {
                        let decoder = JSONDecoder()
//                        if let httpResponse = response as? HTTPURLResponse {
//                            if let token = httpResponse.value(forHTTPHeaderField: Constants.ApiConstants.responseToken) {
//                                GTUserDefaultsManager.shared.setUserToken(token: token)
//                                print("UserToken \(token)")
//                            }
//                        }
                        let returnedResponse = try decoder.decode(Output.self, from: data)
                        completion(.success(returnedResponse))
                      //  print(returnedResponse)
                    } catch {
                        debugPrint(error)
                        completion(.failure(.invalidResponse))
                        return
                    }
                    
                }
            task.resume()
        }
    
}

