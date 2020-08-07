//
//  NewsTableViewController.swift
//  NewsAppMVVM+RxSwift
//
//  Created by mohamed  habib on 07/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {

    let disposeBag = DisposeBag()
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
       
    }
    
    private func  populateNews() {
        
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        
        let resource = Resource<ArticleResponse>(url: url )
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
               
            }).disposed(by: disposeBag)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articleVM.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found")}
        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        
        // we can use Bind ou Driver Approch
        // Using Driver Approch
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabe.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
                   .drive(cell.descriptionLabe.rx.text)
                   .disposed(by: disposeBag)

    
        return cell
    }
    



}
