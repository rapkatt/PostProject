//
//  PostModel.swift
//  TestProject
//
//  Created by Baudunov Rapkat on 10/29/20.
//

import Foundation

struct PostModel:Codable {
    let userId, id: Int?
    let title, body: String?
    
}

struct CommentModel:Codable {
    let name, email, body: String?
}
