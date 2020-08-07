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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
       
    }
    
    private func  populateNews() {
        
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        
        let resource = Resource<ArticleResponse>(url: url )
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    



}
