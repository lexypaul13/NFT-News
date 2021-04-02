//
//  NetworkManager.swift
//  NFT News
//
//  Created by Alex Paul on 4/1/21.
//

import Alamofire
import Parse

class NetworkManger{
    
    static let shared = NetworkManger()
    private let baseURL: String
    private var  apiKeyPathCompononent :String
     private init(){
        self.baseURL = "https://newsapi.org/v2/everything?q=NFT&sortBy=popularity&"
        self.apiKeyPathCompononent = "apiKey=d32071cd286c4f6b9c689527fc195b03"
    }
    private var jsonDecoder:JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()

    
    func getArticles() {
        AF.request(self.baseURL + self.apiKeyPathCompononent, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
                guard let data = responseData.data else {return}
            do {
                let news = try self.jsonDecoder.decode(News.self, from: data)
                let nc = NotificationCenter.default
                nc.post(name: Notification.Name("didFinishParsing"), object: nil)
                   print(news)
                } catch {
                    print(error)
                }
                
            }
        }
        
    
    
}
