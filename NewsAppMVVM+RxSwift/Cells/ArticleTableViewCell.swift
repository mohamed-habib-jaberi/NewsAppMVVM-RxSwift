//
//  ArticleTableViewCell.swift
//  NewsAppMVVM+RxSwift
//
//  Created by mohamed  habib on 07/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabe: UILabel!
    @IBOutlet weak var descriptionLabe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
