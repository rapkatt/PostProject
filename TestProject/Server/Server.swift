//
//  Server.swift
//  TestProject
//
//  Created by Baudunov Rapkat on 10/29/20.
//

import Foundation
import Alamofire
import UIKit

class Server{
    
    static let shared = Server()
    
    let postUrl = "http://jsonplaceholder.typicode.com/posts"
    let commentUrl = "http://jsonplaceholder.typicode.com/comments?postId="
    
    func postShow(completion: @escaping ([PostModel])->()){
        AF.request(postUrl,method: .get, parameters: [:], encoding: URLEncoding.queryString, headers: ["Content-Type" :"application/json"])
            .validate()
            .responseDecodable(of: [PostModel].self) { (response) in
                guard let data = response.value else { return }
                DispatchQueue.main.async {
                    completion(data)
                }
            }
    }
    
    func commentShow(postId:String,completion: @escaping ([CommentModel])->()){
        let url = commentUrl + postId
        AF.request(url,method: .get, parameters: [:], encoding: URLEncoding.queryString, headers: ["Content-Type" :"application/json"])
            .validate()
            .responseDecodable(of: [CommentModel].self) { (response) in
                guard let data = response.value else { return }
                DispatchQueue.main.async {
                    completion(data)
                }
            }
    }
    
    
    
}
