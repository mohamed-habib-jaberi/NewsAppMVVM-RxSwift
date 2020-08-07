//
//  Article.swift
//  NewsAppMVVM+RxSwift
//
//  Created by mohamed  habib on 07/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

struct ArticleResponse : Decodable {
    let articles : [Article]
}

struct Article : Decodable{
    let title : String
    let description : String?
    // let source : Source
    
}
struct Source : Decodable{
    let name : String
}
