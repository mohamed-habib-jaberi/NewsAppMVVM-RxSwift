//
//  ArticleViewModel.swift
//  NewsAppMVVM+RxSwift
//
//  Created by mohamed  habib on 07/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//MARK: - ArticleListViewModel

struct ArticleListViewModel {
    
    let articleVM: [ArticleViewModel]
    
}

extension ArticleListViewModel {
    
    init(_ articles: [Article] ) {
        self.articleVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        
      return  self.articleVM[index]
    }
}
//MARK: - ArticleViewModel
struct ArticleViewModel {
    
    let article: Article
    
    // Depency Injection
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable.just(article.description ?? "")
    }
    
}
